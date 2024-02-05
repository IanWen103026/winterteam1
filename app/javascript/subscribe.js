const faqs = document.querySelectorAll(".faq"),
  prices = document.querySelectorAll(".prices > ul li");

faqs.forEach((faq) => {
  faq.addEventListener("click", () => {
    faq.classList.toggle("active");
  });
});

// Function to handle the click event on a price element
function handleClick(e) {
  const cl = e.currentTarget.dataset.price;
  const allCl = document.querySelectorAll(`.${cl}`);

  // Remove "active" class from all prices
  prices.forEach((price) => {
    price.classList.remove("active");
  });

  // Add "active" class to the clicked price element
  e.currentTarget.classList.add("active");

  // Remove "active" class from all elements with the same class as the clicked element
  allCl.forEach((c) => {
    c.classList.add("active");
  });

  // If the clicked element has class "yearly", remove "active" class from all elements with class "monthly"
  if (cl === "yearly") {
    document.querySelectorAll(".monthly").forEach((m) => {
      m.classList.remove("active");
    });
  } else {
    // If the clicked element has class "monthly", remove "active" class from all elements with class "yearly"
    document.querySelectorAll(".yearly").forEach((y) => {
      y.classList.remove("active");
    });
  }
}

// Attach the click event listener to each price element
prices.forEach((price) => {
  price.addEventListener("click", handleClick);
});
