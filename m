Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E1E31BAD5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 15:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C5189CE3;
	Mon, 15 Feb 2021 14:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5C689CE3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 14:18:27 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id i3so2432100uai.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 06:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JkNyAS6eMcPhEpMPKFlNgf2kOWM3dGOcbf1ISpcwe/c=;
 b=jGZyyVVCYMk0D78xryAnvDALibBeg4qMklKuLcrr12J8ReHaXad2+IHXRrFKFUZb/i
 DeKddPdxdk3ie2ope8DivM/4H2ebX88PjicM50fmm6dK9kAStN3NAkYRXzsw8pvY8y0g
 3c/tyd5xCYQd9XF99JvigikmhQYrEzRGa+iaxcyTMz68t9O5P5J+/Lk+x8PRAx5jJEe5
 ORQNmoHumTAJBzSQkHc4HQmqoK2MJe135Vjx6dWSwrEV/RYlW7w1XWhApmJwr34Yoa9N
 LSYPO82fyPgdoopQihoHWuwPkFTgj9swrEPLPN22kgRfJOCbbIjIB3gqNtvQDFUeyruX
 xEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JkNyAS6eMcPhEpMPKFlNgf2kOWM3dGOcbf1ISpcwe/c=;
 b=Ryw9lKfjRlUrugsh6UH5heB7YZFdz6Ix1i+TMmUMtwCSpOfpSp0jtXhGAy/z3iSG0y
 PTfHY+gEZTv/atpAhaihhlNwea0h+MUgefmaKU7Gm3h/SlzKISttNqP5iRa2rGkanvxt
 O2weRTVhawWcC05EjqDKWLhYqfki2RpxEbdoVmQ5o34Y2Oaw9s1e9szMtLon65doWh5E
 Vajq5JL4OKueEpnEBabXyY6mbaYhmeHnp+cSrUWGrVdClgjvVdO59WUBNgWyW2tQOAGW
 61e733w1444Ajm99h5OIbR7u90xhqOx3x3kFRljvZ8VCyhNc1CzWSmdmiRCdR8+2xMSH
 lDvg==
X-Gm-Message-State: AOAM530Z1ahqZGqdVyzg/WQvCUEW1H1q10v5k1ZtEXEmJ8AKwu0nDnKy
 p52yWJ8mhXWRVqAcaKgrfuMi3yvtmYl+VbMzvOc=
X-Google-Smtp-Source: ABdhPJxu3LvnHPyEAD8T9tnva6iCu0otMcb/YaxTz98zbbc5OoSlhfJkCg/5MtqtrqsJew8ycUpaymlmtDUYA4Ygsz8=
X-Received: by 2002:ab0:5b0e:: with SMTP id u14mr8636749uae.19.1613398706639; 
 Mon, 15 Feb 2021 06:18:26 -0800 (PST)
MIME-Version: 1.0
References: <20210212163229.68270-1-krzk@kernel.org>
 <20210215085241.GG179940@dell>
In-Reply-To: <20210215085241.GG179940@dell>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 15 Feb 2021 14:18:15 +0000
Message-ID: <CACvgo53wn84G8wuyF++=bwtjnVzVB31BA2_JBWnihnwinSFD7A@mail.gmail.com>
Subject: Re: [PATCH v4] MAINTAINERS: move Milo Kim to credits
To: Lee Jones <lee.jones@linaro.org>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev <linux-fbdev@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Linux PM <linux-pm@vger.kernel.org>,
 linux-iio@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Sebastian Reichel <sre@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-leds@vger.kernel.org,
 Jonathan Cameron <jic23@kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Greetings everyone,

On Mon, 15 Feb 2021 at 08:52, Lee Jones <lee.jones@linaro.org> wrote:
>
> On Fri, 12 Feb 2021, Krzysztof Kozlowski wrote:
>
> > Milo Kim's email in TI bounces with permanent error (550: Invalid
> > recipient).  Last email from him on LKML was in 2017.  Move Milo Kim to
> > credits and remove the separate driver entries for:
> >  - TI LP855x backlight driver,
> >  - TI LP8727 charger driver,
> >  - TI LP8788 MFD (ADC, LEDs, charger and regulator) drivers.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Cc: Jingoo Han <jingoohan1@gmail.com>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sebastian Reichel <sre@kernel.org>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> >
> > ---
> >
> > Dear Lee,
> >
> > Could you take care about this patch?
>
> Yes, but I'll be sending out my pull-request for v5.12 in the next
> couple of days (maybe even today if I can find some time), so this
> will have to wait until v5.13.
>
Would it make sense to keep the MAINTAINERS entries as "orphan"?
Checking with linux-next, the drivers are still present in-tree.

HTH
-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
