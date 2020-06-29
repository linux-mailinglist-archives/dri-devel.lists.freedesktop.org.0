Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA9220DD0E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 23:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D3A89C53;
	Mon, 29 Jun 2020 21:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5E289C53
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 21:08:23 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id d15so14225833edm.10
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 14:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WVzOc0zshIAzur/W9UldDSamNUZIg6bYwU7gViF4xjM=;
 b=enoXzPLDbnHssodD/F/gTJgrXYfWlCp3ovGq+4YW5PHdFwdBxkhTZ5jREIWU72glcQ
 xaAAiFbFqSlikZiZQ+w0ZRTHWWwDQSMXKQCMYb38SLExSF8FtP1JfnIlZp584iN6OhGe
 VN8Zs1O/FEmNrQGkzTZJc8vzRYSZQqycFUK1Fh3xHeoCw6EhzVBh84M/RGMWHSJaMN1s
 BBNHBtriZrvXN2Li3Cw9MSFnvzuZiu1JTHM9VW7hs1OmxDT4EWtHbEJtFEjvozaw2MvF
 03I+svRNSczGx1NqHwWRTFmWAyNsk6G5e8can244mmkId4NPZ7Yhqu9G7ZnJLynfg11f
 mmLA==
X-Gm-Message-State: AOAM5305BZfdwfHOSoeYvAGQ4sf6FN5gwPfE1vs+JUqAFNA8nqDoXZHo
 bi/TO5VnxZNQuuEIWCdUeiE=
X-Google-Smtp-Source: ABdhPJz7uJ34zkR7UdIcDmO5eQD/05KE/U7ACuTf+SbkMdyaKDXIEt+RJAAp/9n0LB1FcwdSrdDevA==
X-Received: by 2002:aa7:d6cc:: with SMTP id x12mr11487518edr.354.1593464901568; 
 Mon, 29 Jun 2020 14:08:21 -0700 (PDT)
Received: from kozik-lap ([194.230.155.195])
 by smtp.googlemail.com with ESMTPSA id q3sm736869eds.0.2020.06.29.14.08.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Jun 2020 14:08:20 -0700 (PDT)
Date: Mon, 29 Jun 2020 23:08:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: Re: [PATCH] Remove handhelds.org links and email addresses
Message-ID: <20200629210817.GA32399@kozik-lap>
References: <20200629203121.7892-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629203121.7892-1-grandmaster@al2klimov.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: ulf.hansson@linaro.org, gustavo@embeddedor.com, tony@atomide.com,
 daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wsa+renesas@sang-engineering.com,
 mchehab+samsung@kernel.org, lee.jones@linaro.org, corbet@lwn.net,
 linux-samsung-soc@vger.kernel.org, aaro.koskinen@iki.fi,
 robert.jarzmik@free.fr, rafael.j.wysocki@intel.com, yuehaibing@huawei.com,
 linux@armlinux.org.uk, kgene@kernel.org, viresh.kumar@linaro.org,
 kuba@kernel.org, arnd@arndb.de, b.zolnierkie@samsung.com,
 jani.nikula@intel.com, linux-mmc@vger.kernel.org, linux-input@vger.kernel.org,
 j.neuschaefer@gmx.net, haojian.zhuang@gmail.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 yanaijie@huawei.com, gregkh@linuxfoundation.org, dmitry.torokhov@gmail.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Julia.Lawall@inria.fr,
 netdev@vger.kernel.org, davem@davemloft.net, daniel@zonque.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 29, 2020 at 10:31:21PM +0200, Alexander A. Klimov wrote:
> Rationale:
> https://lore.kernel.org/linux-doc/20200626110706.7b5d4a38@lwn.net/
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  @Jon I thought about what I said and *no*, unfortunately I *can't* automate
>  the detection of such as easy as the HTTPSifying. As you maybe see below
>  cleaning up is even "harder".
> 
>  We have only 17 files and one domain here. Shall I split it up per subsystem
>  or can we let it as is?
> 
>  Documentation/arm/sa1100/assabet.rst           |  2 --
>  Documentation/arm/samsung-s3c24xx/h1940.rst    | 10 ----------
>  Documentation/arm/samsung-s3c24xx/overview.rst |  3 +--
>  Documentation/arm/samsung-s3c24xx/smdk2440.rst |  4 ----
>  arch/arm/mach-omap1/Kconfig                    |  4 +---
>  arch/arm/mach-pxa/h5000.c                      |  2 +-
>  arch/arm/mach-s3c24xx/mach-h1940.c             |  2 --
>  arch/arm/mach-s3c24xx/mach-n30.c               |  3 ---
>  arch/arm/mach-s3c24xx/mach-rx3715.c            |  2 --

For s3c24xx, I am fine taking it through docs tree:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Otherwise, after splitting, I could take the s3c-24xx bits.

Best regards,
Krzysztof


>  drivers/input/keyboard/gpio_keys.c             |  2 +-
>  drivers/input/keyboard/jornada720_kbd.c        |  2 +-
>  drivers/input/touchscreen/jornada720_ts.c      |  2 +-
>  drivers/mfd/asic3.c                            |  2 +-
>  drivers/mmc/host/renesas_sdhi_core.c           |  2 +-
>  drivers/net/ethernet/dec/tulip/de4x5.c         |  1 -
>  drivers/video/fbdev/sa1100fb.c                 |  2 +-
>  include/linux/apm-emulation.h                  |  2 --
>  17 files changed, 9 insertions(+), 38 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
