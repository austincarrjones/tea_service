# Tea Subscription API

This is a Ruby on Rails API for managing customers' tea subscriptions. The API provides a way for a frontend team to allow customers to subscribe to different teas, manage their subscriptions, and view all their active and canceled subscriptions.

---

## Quick Start
1. Fork and Clone this repo
2. Run `bundle install`
3. Set up the database `rails db:{drop,create,migrate,seed}`
5. Run local server with `rails s`

## Database Diagram:
![Screenshot 2024-08-16 at 4 12 17 PM](https://github.com/user-attachments/assets/b90bb275-078c-4b33-98e5-387a9becffe4)

---

## Endpoints

### 1. Create a Subscription
**POST /api/v1/customers/:customer_id/subscriptions**

Parameters:
- customer_id: The ID of the customer.
- tea_id: The ID of the tea.
- title: The title of the subscription.
- frequency: The frequency of the subscription (weekly, monthly, quarterly).

Request Body:
```
 {
  "customer_id": 1,
  "tea_id": 2,
  "title": "Wind Down Tea Subscription",
  "frequency": "monthly"
}
```

Response Example:
```
{
  "data": {
    "id": "1",
    "type": "subscription",
    "attributes": {
      "title": "Wind Down Tea Subscription",
      "customer_id": 1,
      "tea_id": 2,
      "status": "active",
      "frequency": "monthly",
      "price": 5.00
    }
  }
}
```
---

### 2. Update a Subscription
**PATCH /api/v1/customers/:customer_id/subscriptions/:id**

Request Body:
```
{
  "status": "cancelled"
}
```

Response Example:
```
{
  "data": {
    "id": "1",
    "type": "subscription",
    "attributes": {
      "title": "Wind Down Tea Subscription",
      "customer_id": 1,
      "tea_id": 2,
      "status": "cancelled",
      "frequency": "monthly",
      "price": 5.00
    }
  }
}
```
---

### 3. Get All Subscriptions for a Customer

**GET /api/v1/customers/:customer_id/subscriptions**

Response Example:
```
{
  "data": [
    {
      "id": "1",
      "type": "subscription",
      "attributes": {
        "title": "Wind Down Tea Subscription",
        "customer_id": 1,
        "tea_id": 2,
        "status": "active",
        "frequency": "monthly",
        "price": 5.00
      }
    },
    {
      "id": "2",
      "type": "subscription",
      "attributes": {
        "title": "Morning Boost Tea Subscription",
        "customer_id": 1,
        "tea_id": 3,
        "status": "cancelled",
        "frequency": "weekly",
        "price": 20.00
      }
    }
  ]
}
```
