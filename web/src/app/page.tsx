'use client';

import { useState, useEffect } from 'react';
import {
    LayoutDashboard,
    Package,
    Users,
    DollarSign,
    FileText,
    MessageSquare,
    Settings,
    Search,
    Menu,
    X,
    ChevronRight,
    TrendingUp,
    TrendingDown,
    Minus
} from 'lucide-react';

// API base URL - direct to backend for Docker standalone mode
const API_BASE = typeof window !== 'undefined' 
    ? 'http://localhost:8000/api/v1'  // Browser
    : 'http://api:8000/api/v1';        // Server-side

// Stats component
function StatCard({
    label,
    value,
    change,
    icon: Icon
}: {
    label: string;
    value: string | number;
    change?: number;
    icon: any;
}) {
    return (
        <div className="stat-card card-hover">
            <div className="flex items-center justify-between">
                <div>
                    <p className="stat-label">{label}</p>
                    <p className="stat-value">{value}</p>
                </div>
                <div className="w-12 h-12 rounded-full bg-primary-100 flex items-center justify-center">
                    <Icon className="w-6 h-6 text-primary-600" />
                </div>
            </div>
            {change !== undefined && (
                <div className="mt-3 flex items-center text-sm">
                    {change > 0 ? (
                        <>
                            <TrendingUp className="w-4 h-4 text-green-500 mr-1" />
                            <span className="text-green-600">+{change}%</span>
                        </>
                    ) : change < 0 ? (
                        <>
                            <TrendingDown className="w-4 h-4 text-red-500 mr-1" />
                            <span className="text-red-600">{change}%</span>
                        </>
                    ) : (
                        <>
                            <Minus className="w-4 h-4 text-slate-400 mr-1" />
                            <span className="text-slate-500">Không đổi</span>
                        </>
                    )}
                    <span className="text-slate-400 ml-2">so với tháng trước</span>
                </div>
            )}
        </div>
    );
}

// Sidebar navigation
function Sidebar({
    isOpen,
    onClose,
    activeTab,
    setActiveTab
}: {
    isOpen: boolean;
    onClose: () => void;
    activeTab: string;
    setActiveTab: (tab: string) => void;
}) {
    const navItems = [
        { id: 'dashboard', label: 'Tổng quan', icon: LayoutDashboard },
        { id: 'materials', label: 'Vật liệu', icon: Package },
        { id: 'contractors', label: 'Nhà thầu', icon: Users },
        { id: 'rates', label: 'Đơn giá NC', icon: DollarSign },
        { id: 'work-items', label: 'XSMM Items', icon: FileText },
        { id: 'copilot', label: 'AI Copilot', icon: MessageSquare },
    ];

    return (
        <>
            {/* Overlay for mobile */}
            {isOpen && (
                <div
                    className="fixed inset-0 bg-black/50 z-40 lg:hidden"
                    onClick={onClose}
                />
            )}

            {/* Sidebar */}
            <aside className={`
        fixed top-0 left-0 z-50 h-full w-64 bg-slate-900 text-white
        transform transition-transform duration-300 ease-in-out
        lg:translate-x-0 lg:static lg:z-auto
        ${isOpen ? 'translate-x-0' : '-translate-x-full'}
      `}>
                {/* Logo */}
                <div className="h-16 flex items-center justify-between px-6 border-b border-slate-700">
                    <div className="flex items-center gap-2">
                        <div className="w-8 h-8 bg-primary-500 rounded-lg flex items-center justify-center font-bold">
                            X
                        </div>
                        <span className="font-semibold text-lg">XSMM Admin</span>
                    </div>
                    <button onClick={onClose} className="lg:hidden">
                        <X className="w-5 h-5" />
                    </button>
                </div>

                {/* Navigation */}
                <nav className="p-4 space-y-1">
                    {navItems.map((item) => (
                        <button
                            key={item.id}
                            onClick={() => {
                                setActiveTab(item.id);
                                onClose();
                            }}
                            className={`
                w-full flex items-center gap-3 px-4 py-3 rounded-lg
                transition-colors duration-200
                ${activeTab === item.id
                                    ? 'bg-primary-600 text-white'
                                    : 'text-slate-300 hover:bg-slate-800 hover:text-white'
                                }
              `}
                        >
                            <item.icon className="w-5 h-5" />
                            <span>{item.label}</span>
                            {activeTab === item.id && (
                                <ChevronRight className="w-4 h-4 ml-auto" />
                            )}
                        </button>
                    ))}
                </nav>

                {/* Settings at bottom */}
                <div className="absolute bottom-0 left-0 right-0 p-4 border-t border-slate-700">
                    <button className="w-full flex items-center gap-3 px-4 py-3 rounded-lg text-slate-300 hover:bg-slate-800 hover:text-white transition-colors">
                        <Settings className="w-5 h-5" />
                        <span>Cài đặt</span>
                    </button>
                </div>
            </aside>
        </>
    );
}

// Dashboard content
function DashboardContent() {
    const [stats, setStats] = useState({
        workItems: 0,
        materials: 0,
        contractors: 0,
        rates: 0,
    });

    useEffect(() => {
        // Fetch stats
        Promise.all([
            fetch(`${API_BASE}/work-items/count`).then(r => r.json()),
        ]).then(([workItems]) => {
            setStats({
                workItems: workItems.count || 351,
                materials: 9,
                contractors: 5,
                rates: 11,
            });
        }).catch(() => {
            // Use default values if API not available
            setStats({
                workItems: 351,
                materials: 9,
                contractors: 5,
                rates: 11,
            });
        });
    }, []);

    return (
        <div className="space-y-6">
            <div>
                <h1 className="text-2xl font-bold text-slate-900">Tổng quan</h1>
                <p className="text-slate-500 mt-1">Xin chào! Đây là tổng quan hệ thống XSMM.</p>
            </div>

            {/* Stats Grid */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                <StatCard
                    label="XSMM Work Items"
                    value={stats.workItems}
                    icon={FileText}
                />
                <StatCard
                    label="Vật liệu"
                    value={stats.materials}
                    change={5}
                    icon={Package}
                />
                <StatCard
                    label="Nhà thầu"
                    value={stats.contractors}
                    icon={Users}
                />
                <StatCard
                    label="Đơn giá NC"
                    value={stats.rates}
                    change={-2}
                    icon={DollarSign}
                />
            </div>

            {/* Quick Actions */}
            <div className="card">
                <h2 className="text-lg font-semibold mb-4">Thao tác nhanh</h2>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <button className="btn btn-secondary flex items-center justify-center gap-2">
                        <Package className="w-4 h-4" />
                        Thêm vật liệu mới
                    </button>
                    <button className="btn btn-secondary flex items-center justify-center gap-2">
                        <Users className="w-4 h-4" />
                        Thêm nhà thầu
                    </button>
                    <button className="btn btn-primary flex items-center justify-center gap-2">
                        <MessageSquare className="w-4 h-4" />
                        Mở AI Copilot
                    </button>
                </div>
            </div>

            {/* Recent Activity */}
            <div className="card">
                <h2 className="text-lg font-semibold mb-4">Cập nhật gần đây</h2>
                <div className="space-y-3">
                    {[
                        { action: 'Thêm vật liệu', item: 'Gạch Vietceramic 600x600', time: '5 phút trước' },
                        { action: 'Cập nhật giá', item: 'Sơn Dulux Inspire 5L', time: '1 giờ trước' },
                        { action: 'Thêm nhà thầu', item: 'Thầu Minh - Nội thất', time: '2 giờ trước' },
                    ].map((activity, i) => (
                        <div key={i} className="flex items-center justify-between py-2 border-b border-slate-100 last:border-0">
                            <div>
                                <span className="font-medium text-slate-700">{activity.action}</span>
                                <span className="text-slate-400 mx-2">•</span>
                                <span className="text-slate-600">{activity.item}</span>
                            </div>
                            <span className="text-sm text-slate-400">{activity.time}</span>
                        </div>
                    ))}
                </div>
            </div>
        </div>
    );
}

// Materials list
function MaterialsContent() {
    const [materials, setMaterials] = useState<any[]>([]);
    const [search, setSearch] = useState('');
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        setLoading(true);
        fetch(`${API_BASE}/materials/?search=${search}&limit=50`)
            .then(r => r.json())
            .then(data => {
                setMaterials(Array.isArray(data) ? data : []);
                setLoading(false);
            })
            .catch(() => setLoading(false));
    }, [search]);

    return (
        <div className="space-y-6">
            <div className="flex items-center justify-between">
                <div>
                    <h1 className="text-2xl font-bold text-slate-900">Vật liệu</h1>
                    <p className="text-slate-500 mt-1">Quản lý catalog vật liệu xây dựng</p>
                </div>
                <button className="btn btn-primary">+ Thêm mới</button>
            </div>

            {/* Search */}
            <div className="relative">
                <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400" />
                <input
                    type="text"
                    placeholder="Tìm kiếm vật liệu..."
                    className="input pl-10"
                    value={search}
                    onChange={(e) => setSearch(e.target.value)}
                />
            </div>

            {/* Table */}
            <div className="table-container">
                <table className="table">
                    <thead>
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Thương hiệu</th>
                            <th>Mã SP</th>
                            <th>Đơn vị</th>
                            <th>Giá</th>
                            <th>Trạng thái</th>
                        </tr>
                    </thead>
                    <tbody>
                        {loading ? (
                            <tr>
                                <td colSpan={6} className="text-center py-8 text-slate-500">
                                    Đang tải...
                                </td>
                            </tr>
                        ) : materials.length === 0 ? (
                            <tr>
                                <td colSpan={6} className="text-center py-8 text-slate-500">
                                    Chưa có dữ liệu. Chạy docker compose để import data.
                                </td>
                            </tr>
                        ) : (
                            materials.map((mat) => (
                                <tr key={mat.id}>
                                    <td className="font-medium">{mat.name}</td>
                                    <td>{mat.brand || '-'}</td>
                                    <td><code className="text-xs bg-slate-100 px-2 py-1 rounded">{mat.product_code || '-'}</code></td>
                                    <td>{mat.unit}</td>
                                    <td className="font-medium">
                                        {mat.current_price
                                            ? new Intl.NumberFormat('vi-VN').format(mat.current_price) + ' ₫'
                                            : mat.base_price
                                                ? new Intl.NumberFormat('vi-VN').format(mat.base_price) + ' ₫'
                                                : '-'
                                        }
                                    </td>
                                    <td>
                                        <span className={`badge ${mat.is_active ? 'badge-success' : 'badge-danger'}`}>
                                            {mat.is_active ? 'Active' : 'Inactive'}
                                        </span>
                                    </td>
                                </tr>
                            ))
                        )}
                    </tbody>
                </table>
            </div>
        </div>
    );
}

// Work Items list
function WorkItemsContent() {
    const [items, setItems] = useState<any[]>([]);
    const [search, setSearch] = useState('');
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        setLoading(true);
        const url = search
            ? `${API_BASE}/work-items/search/?q=${search}&limit=50`
            : `${API_BASE}/work-items/?limit=50`;

        fetch(url)
            .then(r => r.json())
            .then(data => {
                setItems(Array.isArray(data) ? data : []);
                setLoading(false);
            })
            .catch(() => setLoading(false));
    }, [search]);

    return (
        <div className="space-y-6">
            <div>
                <h1 className="text-2xl font-bold text-slate-900">XSMM Work Items</h1>
                <p className="text-slate-500 mt-1">351 công tác xây dựng chuẩn hóa</p>
            </div>

            {/* Search */}
            <div className="relative">
                <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400" />
                <input
                    type="text"
                    placeholder="Tìm theo mã hoặc tên công tác..."
                    className="input pl-10"
                    value={search}
                    onChange={(e) => setSearch(e.target.value)}
                />
            </div>

            {/* Table */}
            <div className="table-container">
                <table className="table">
                    <thead>
                        <tr>
                            <th>Mã</th>
                            <th>Tên công tác</th>
                            <th>Đơn vị</th>
                            <th>Công thức</th>
                        </tr>
                    </thead>
                    <tbody>
                        {loading ? (
                            <tr>
                                <td colSpan={4} className="text-center py-8 text-slate-500">
                                    Đang tải...
                                </td>
                            </tr>
                        ) : items.length === 0 ? (
                            <tr>
                                <td colSpan={4} className="text-center py-8 text-slate-500">
                                    Không tìm thấy kết quả
                                </td>
                            </tr>
                        ) : (
                            items.map((item) => (
                                <tr key={item.id}>
                                    <td>
                                        <code className="text-xs bg-primary-100 text-primary-700 px-2 py-1 rounded font-medium">
                                            {item.code}
                                        </code>
                                    </td>
                                    <td className="font-medium">{item.name}</td>
                                    <td>{item.unit}</td>
                                    <td className="text-sm text-slate-500">{item.formula || item.measurement_method || '-'}</td>
                                </tr>
                            ))
                        )}
                    </tbody>
                </table>
            </div>
        </div>
    );
}

// AI Copilot Chat
function CopilotContent() {
    const [message, setMessage] = useState('');
    const [messages, setMessages] = useState<{ role: string, content: string }[]>([]);
    const [loading, setLoading] = useState(false);

    const sendMessage = async () => {
        if (!message.trim() || loading) return;

        const userMessage = message;
        setMessage('');
        setMessages(prev => [...prev, { role: 'user', content: userMessage }]);
        setLoading(true);

        try {
            const response = await fetch(`${API_BASE}/copilot/chat`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    message: userMessage,
                    history: messages,
                    context: {},
                }),
            });

            const data = await response.json();
            setMessages(prev => [...prev, { role: 'assistant', content: data.message }]);
        } catch (error) {
            setMessages(prev => [...prev, {
                role: 'assistant',
                content: '❌ Không thể kết nối API. Vui lòng chạy docker compose up -d'
            }]);
        }

        setLoading(false);
    };

    return (
        <div className="h-[calc(100vh-8rem)] flex flex-col">
            <div className="mb-4">
                <h1 className="text-2xl font-bold text-slate-900">AI Copilot</h1>
                <p className="text-slate-500 mt-1">Hỗ trợ QS tính giá thành xây dựng</p>
            </div>

            {/* Chat Area */}
            <div className="flex-1 card overflow-hidden flex flex-col">
                {/* Messages */}
                <div className="flex-1 overflow-y-auto p-4 space-y-4">
                    {messages.length === 0 ? (
                        <div className="text-center text-slate-400 py-12">
                            <MessageSquare className="w-12 h-12 mx-auto mb-4 opacity-50" />
                            <p>Hãy hỏi tôi về công tác xây dựng, đơn giá, hoặc vật liệu.</p>
                            <p className="text-sm mt-2">Ví dụ: "Tính khối lượng bê tông móng băng 0.4x0.8m dài 45m"</p>
                        </div>
                    ) : (
                        messages.map((msg, i) => (
                            <div
                                key={i}
                                className={`flex ${msg.role === 'user' ? 'justify-end' : 'justify-start'}`}
                            >
                                <div
                                    className={`max-w-[80%] rounded-2xl px-4 py-3 ${msg.role === 'user'
                                            ? 'bg-primary-600 text-white'
                                            : 'bg-slate-100 text-slate-800'
                                        }`}
                                >
                                    <pre className="whitespace-pre-wrap font-sans text-sm">{msg.content}</pre>
                                </div>
                            </div>
                        ))
                    )}
                    {loading && (
                        <div className="flex justify-start">
                            <div className="bg-slate-100 rounded-2xl px-4 py-3">
                                <div className="flex gap-1">
                                    <span className="w-2 h-2 bg-slate-400 rounded-full animate-bounce" style={{ animationDelay: '0ms' }}></span>
                                    <span className="w-2 h-2 bg-slate-400 rounded-full animate-bounce" style={{ animationDelay: '150ms' }}></span>
                                    <span className="w-2 h-2 bg-slate-400 rounded-full animate-bounce" style={{ animationDelay: '300ms' }}></span>
                                </div>
                            </div>
                        </div>
                    )}
                </div>

                {/* Input */}
                <div className="border-t p-4">
                    <div className="flex gap-3">
                        <input
                            type="text"
                            placeholder="Nhập câu hỏi..."
                            className="input flex-1"
                            value={message}
                            onChange={(e) => setMessage(e.target.value)}
                            onKeyDown={(e) => e.key === 'Enter' && sendMessage()}
                            disabled={loading}
                        />
                        <button
                            className="btn btn-primary px-6"
                            onClick={sendMessage}
                            disabled={loading}
                        >
                            Gửi
                        </button>
                    </div>
                </div>
            </div>
        </div>
    );
}

// Placeholder content
function PlaceholderContent({ title }: { title: string }) {
    return (
        <div className="card text-center py-12">
            <h1 className="text-2xl font-bold text-slate-900 mb-2">{title}</h1>
            <p className="text-slate-500">Tính năng đang được phát triển...</p>
        </div>
    );
}

// Main App
export default function Home() {
    const [sidebarOpen, setSidebarOpen] = useState(false);
    const [activeTab, setActiveTab] = useState('dashboard');

    const renderContent = () => {
        switch (activeTab) {
            case 'dashboard':
                return <DashboardContent />;
            case 'materials':
                return <MaterialsContent />;
            case 'work-items':
                return <WorkItemsContent />;
            case 'copilot':
                return <CopilotContent />;
            case 'contractors':
                return <PlaceholderContent title="Nhà thầu" />;
            case 'rates':
                return <PlaceholderContent title="Đơn giá nhân công" />;
            default:
                return <DashboardContent />;
        }
    };

    return (
        <div className="min-h-screen flex">
            <Sidebar
                isOpen={sidebarOpen}
                onClose={() => setSidebarOpen(false)}
                activeTab={activeTab}
                setActiveTab={setActiveTab}
            />

            {/* Main content */}
            <div className="flex-1 flex flex-col min-h-screen lg:ml-0">
                {/* Header */}
                <header className="h-16 bg-white border-b border-slate-200 flex items-center justify-between px-6 sticky top-0 z-30">
                    <button
                        onClick={() => setSidebarOpen(true)}
                        className="lg:hidden"
                    >
                        <Menu className="w-6 h-6" />
                    </button>

                    <div className="flex items-center gap-4 ml-auto">
                        <div className="relative hidden md:block">
                            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
                            <input
                                type="text"
                                placeholder="Tìm kiếm..."
                                className="pl-9 pr-4 py-2 bg-slate-100 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-primary-500 w-64"
                            />
                        </div>
                        <div className="w-8 h-8 bg-primary-600 rounded-full flex items-center justify-center text-white font-medium">
                            Q
                        </div>
                    </div>
                </header>

                {/* Page content */}
                <main className="flex-1 p-6 overflow-auto">
                    {renderContent()}
                </main>
            </div>
        </div>
    );
}
