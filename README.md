# 🍔 Food Delivery App

A modern and fully-featured **Food Delivery App** built with **Flutter (frontend)** and **NestJS (backend)**.  
Designed as a full-stack showcase project, based on a professional Figma UI design.

---

## 📱 Frontend (Flutter)

- Built using `Flutter`, `go_router`, `flutter_bloc` and `dio`
- Modern UI layout (onboarding, auth, cart, checkout, tracking)
- Themeable, modular code with `freezed` models and custom widgets

## 🌐 Backend (NestJS + TypeScript)

- RESTful API using `NestJS` with `JWT` authentication
- PostgreSQL with `Prisma` ORM
- Modules for: Auth, Users, Restaurants, Menu, Orders, Payments

---

## 🧠 Features Overview

### ✅ General

- Onboarding flow
- Authentication (Login, Register, OTP, Forgot password)
- Role-based routing (User / Admin)
- Internationalization ready

### 🍴 User

- Browse restaurants and meals by category
- Add to cart, checkout, track orders
- Payment method selection
- View order history
- Profile & settings

### 🛠️ Admin

- Dashboard: orders, reviews, revenue
- Add/edit food items
- Manage user reviews and data

---

## 🧪 Testing

- Flutter `widget` and `integration_test`
- NestJS `e2e` and `unit` tests

---

## 🚀 Getting Started

### Frontend

```bash
cd frontend
flutter pub get
flutter run
```

### Backend

```bash
cd backend
npm install
npm run start:dev
```

---

## 📦 Tech Stack

| Layer    | Stack                      |
| -------- | -------------------------- |
| Frontend | Flutter, go_router, Dio    |
| Backend  | NestJS, TypeScript, Prisma |
| Database | PostgreSQL                 |
| Auth     | JWT, bcrypt                |

---

## 📸 UI Preview

_Screenshots coming soon_

---

## 🧑‍💻 Author

**Vedran Vučić**  
📫 [vedran@example.com]  
🌍 [GitHub](https://github.com/vedran77)

---

## 📄 License

[MIT](LICENSE)
