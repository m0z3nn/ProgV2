<?php
// Подключение к базе данных
$pdo = new PDO('mysql:host=localhost;dbname=test', 'root', '');

// Выполнение запроса для получения списка организаций
$stmt = $pdo->prepare('SELECT * FROM Org');
$stmt->execute();
$orgs = $stmt->fetchAll();
?>

<!-- Создание формы -->
<form method="post">
    <label for="date_now">Дата:</label>
    <input type="date" id="date_now" name="date_now" required><br><br>

    <label for="id_org">Организация:</label>
    <select id="id_org" name="id_org" required>
        <?php foreach ($orgs as $org) { ?>
            <option value="<?php echo $org['ID_org']; ?>"><?php echo $org['name_org']; ?></option>
        <?php } ?>
    </select><br><br>

    <label for="password_eqip">Пароль оборудования:</label>
    <input type="text" id="password_eqip" name="password_eqip" required><br><br>

    <label for="comments">Комментарии:</label>
    <textarea id="comments" name="comments"></textarea><br><br>

    <label for="actuality">Актуальность:</label>
    <input type="checkbox" id="actuality" name="actuality" value="1"><br><br>

    <button type="submit">Добавить данные</button>
</form>

<?php
// Обработка формы
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $date_now = $_POST['date_now'];
    $id_org = $_POST['id_org'];
    $password_eqip = $_POST['password_eqip'];
    $comments = $_POST['comments'];
    $actuality = $_POST['actuality'] ? 1 : 0;

    // Выполнение запроса для добавления данных в таблицу Datas
    $stmt = $pdo->prepare('INSERT INTO Datas (DateNow, ID_org, password_eqip, comments, actuality) VALUES (?, ?, ?, ?, ?)');
    $stmt->execute([$date_now, $id_org, $password_eqip, $comments, $actuality]);

    echo 'Данные добавлены успешно!';
}
?>