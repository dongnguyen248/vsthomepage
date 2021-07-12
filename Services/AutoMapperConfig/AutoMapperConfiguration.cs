﻿using AutoMapper;

namespace Services.AutoMapperConfig
{
    public class AutoMapperConfiguration
    {
        public static MapperConfiguration Config()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<MappingProfile>();
            });
            return config;
        }
    }
}