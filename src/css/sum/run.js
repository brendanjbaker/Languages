import puppeteer from "puppeteer";

const browser = await puppeteer.launch({
	args: ["--no-sandbox", "--disable-setuid-sandbox"]
});

const page = await browser.newPage();

await page.goto("file://" + process.cwd() + "/program.html");

const result =
	await page.evaluate(() => {
		const element = document.querySelector("#output");
		const computedStyle = getComputedStyle(element);
		const width = computedStyle.width;

		return width;
	});

console.log(result);

await browser.close();
