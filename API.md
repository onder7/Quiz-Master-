# Quiz Master API Dokümantasyonu

## Genel Bilgiler

- Base URL: `https://yourdomain.com/api`
- Tüm istekler için authentication gereklidir (session-based)
- Response format: JSON

## Endpoints

### Quiz API

#### Kategorileri Getir
```
GET /api/categories?difficulty={difficulty}
```

**Parameters:**
- `difficulty` (optional): easy, medium, hard, all

**Response:**
```json
[
  {
    "category": "genel",
    "count": 25
  },
  {
    "category": "matematik",
    "count": 15
  }
]
```

#### Cevap Kontrol
```
POST /api/check-answer
```

**Body:**
```json
{
  "question_id": 123,
  "answer": "b"
}
```

**Response:**
```json
{
  "correct": true,
  "correct_answer": "b"
}
```

### Multiplayer API

#### Oda Durumu Kontrol
```
GET /api/multiplayer/room-status?room_id={room_id}
```

**Response:**
```json
{
  "status": "ready",
  "host": {
    "id": 1,
    "username": "player1"
  },
  "guest": {
    "id": 2,
    "username": "player2"
  },
  "players_ready": {
    "total": 2,
    "ready": 1
  }
}
```

#### Rakip Durumu
```
GET /api/multiplayer/opponent-status?room_id={room_id}
```

**Response:**
```json
{
  "player_score": 5,
  "player_question": 8,
  "opponent_score": 4,
  "opponent_question": 7,
  "opponent_finished": false,
  "room_status": "playing"
}
```

#### Son Oyunlar
```
GET /api/multiplayer/recent-games
```

**Response:**
```json
[
  {
    "room_id": 1,
    "room_code": "ABC123",
    "host_id": 1,
    "guest_id": 2,
    "host_username": "player1",
    "guest_username": "player2",
    "host_score": 8,
    "guest_score": 6,
    "winner_id": 1,
    "result": "win",
    "completed_at": "2025-01-29 15:30:00"
  }
]
```

#### Multiplayer İstatistikler
```
GET /api/multiplayer/stats
```

**Response:**
```json
{
  "total_games": 15,
  "wins": 8,
  "draws": 2,
  "losses": 5
}
```

### Multiplayer Actions

#### Oda Oluştur
```
POST /multiplayer/create
```

**Body:**
```
difficulty=medium&category=all&question_count=10
```

**Response:**
```json
{
  "success": true,
  "room_code": "ABC123",
  "room_id": 1
}
```

#### Odaya Katıl
```
POST /multiplayer/join
```

**Body:**
```
room_code=ABC123
```

**Response:**
```json
{
  "success": true,
  "room_id": 1
}
```

#### Hazır Ol
```
POST /multiplayer/ready
```

**Body:**
```
room_id=1
```

**Response:**
```json
{
  "success": true
}
```

#### Cevap Gönder (Multiplayer)
```
POST /multiplayer/answer
```

**Body:**
```
room_id=1&answer=b&time_taken=15
```

**Response:**
```json
{
  "correct": true,
  "correct_answer": "b"
}
```

## Error Responses

Tüm hatalar aşağıdaki formatta döner:

```json
{
  "error": "Error message",
  "success": false
}
```

### Error Codes

- `400` - Bad Request (Eksik veya hatalı parametre)
- `401` - Unauthorized (Giriş yapılmamış)
- `404` - Not Found (Kayıt bulunamadı)
- `500` - Internal Server Error

## Rate Limiting

- Dakikada maksimum 60 istek
- Multiplayer endpoints için dakikada 120 istek

## WebSocket Events (Gelecek)

Gerçek zamanlı multiplayer için WebSocket desteği planlanmaktadır:

```javascript
// Odaya katıl
socket.emit('join_room', { room_id: 1, user_id: 2 });

// Cevap gönder
socket.emit('answer', { room_id: 1, answer: 'b' });

// Rakip cevapladı
socket.on('opponent_answered', (data) => {
  console.log('Opponent score:', data.score);
});

// Oyun bitti
socket.on('game_finished', (data) => {
  console.log('Winner:', data.winner_id);
});
```

## Örnek İstemci Kodu

### JavaScript (Fetch API)
```javascript
// Oda oluştur
async function createRoom() {
  const response = await fetch('/multiplayer/create', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: 'difficulty=medium&question_count=10'
  });
  
  const data = await response.json();
  if (data.success) {
    console.log('Room code:', data.room_code);
  }
}

// Rakip durumunu kontrol et
async function checkOpponent(roomId) {
  const response = await fetch(`/api/multiplayer/opponent-status?room_id=${roomId}`);
  const data = await response.json();
  
  updateScoreDisplay(data.opponent_score);
  updateProgressBar(data.opponent_question);
}
```

### PHP
```php
// Oda oluştur
$ch = curl_init('https://yourdomain.com/multiplayer/create');
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query([
    'difficulty' => 'medium',
    'question_count' => 10
]));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_COOKIE, session_name() . '=' . session_id());

$response = curl_exec($ch);
$data = json_decode($response, true);

if ($data['success']) {
    echo "Room code: " . $data['room_code'];
}
```
