<?php
// Соединение с базой данных
$pdo = new PDO('mysql:host=localhost;dbname=test', 'root', '');

// Выполнение запроса для получения организаций
$stmt = $pdo->prepare('SELECT * FROM Org');
$stmt->execute();
$orgs = $stmt->fetchAll();

// Выполнение запроса для получения пользователей
$stmt = $pdo->prepare('SELECT * FROM Users');
$stmt->execute();
$users = $stmt->fetchAll();
?>

<style>
    select {
        width: 250px;
        height: 60px;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
    }
    option {
        padding: 10px;
    }
</style>

<form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
    <select name="org_id">
        <?php foreach ($orgs as $org) { ?>
            <option value="<?php echo $org['ID_org']; ?>"><?php echo $org['name_org']; ?></option>
        <?php } ?>
    </select>

    <select name="user_id">
        <?php foreach ($users as $user) { ?>
            <option value="<?php echo $user['ID_users']; ?>"><?php echo $user['login']; ?></option>
        <?php } ?>
    </select>

    <button type="submit">Добавить доступ</button>
</form>

<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $org_id = $_POST['org_id'];
    $user_id = $_POST['user_id'];

    // Начало транзакции
    $pdo->beginTransaction();

    try {
        // Выполнение запроса для добавления записи в таблицу доступа
        $stmt = $pdo->prepare('INSERT INTO pass (ID_org, ID_users) VALUES (?, ?)');
        $stmt->execute([$org_id, $user_id]);

        // Коммит транзакции
        $pdo->commit();

        echo 'Доступ добавлен успешно!';
    } catch (Exception $e) {
        // Откат транзакции в случае ошибки
        $pdo->rollBack();

        echo 'Ошибка добавления доступа: ' . $e->getMessage();
    }
}
?>