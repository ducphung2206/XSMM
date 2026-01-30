import type { Metadata } from 'next';
import './globals.css';

export const metadata: Metadata = {
    title: 'XSMM Admin - Xhome SG',
    description: 'Quản lý đơn giá và vật liệu xây dựng',
};

export default function RootLayout({
    children,
}: {
    children: React.ReactNode;
}) {
    return (
        <html lang="vi">
            <body className="antialiased">{children}</body>
        </html>
    );
}
