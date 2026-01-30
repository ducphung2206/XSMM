/* global Excel */

export async function insertData(data: any) {
  try {
    await Excel.run(async (context) => {
      const range = context.workbook.getSelectedRange();
      
      // Determine what to insert based on data type
      if (typeof data === "string") {
        range.values = [[data]];
      } else if (Array.isArray(data)) {
         // Assuming 2D array for table data
         // Check if it's 1D or 2D
         if (Array.isArray(data[0])) {
             range.values = data;
         } else {
             // 1D array -> row
             range.values = [data];
         }
      } else if (typeof data === 'object') {
          // If it's a Work Item object
          if (data.work_item) {
              const item = data.work_item;
              const quantity = data.quantity || 0;
              const unit = item.unit || "";
              const price = data.cost_estimate ? data.cost_estimate.avg : 0;
              
              const row = [
                  item.code,
                  item.name,
                  unit,
                  quantity,
                  price,
                  quantity * price
              ];
              
              // We need to resize the range to fit 1 row, 6 columns
              const insertRange = range.getResizedRange(0, 5);
              insertRange.values = [row];
              insertRange.format.autofitColumns();
          } else {
              // Generic object, just verify if we can dump it
              range.values = [[JSON.stringify(data)]];
          }
      }

      await context.sync();
    });
  } catch (error) {
    console.error("Excel insert error:", error);
  }
}

export async function getSelectionContext() {
    return await Excel.run(async (context) => {
        const range = context.workbook.getSelectedRange();
        range.load(["values", "address"]);
        await context.sync();
        return {
            address: range.address,
            values: range.values
        };
    });
}
