﻿using System.Collections.Generic;

namespace YoloEcommerce.Entities
{
    public class Category
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string? Description { get; set; }
        public ICollection<Product> Products { get; set; }
    }
}
