Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D632273B75
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439BA6E0AD;
	Tue, 22 Sep 2020 07:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F173C6E0AD
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 07:08:52 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4868A23A5F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 07:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600758532;
 bh=Q9EIerF2YpUp4pwyWgck/zaWlyKSSyBy1o2vS+YkpDw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yLaNCV3E1ni8PMWPJKhZHUP5zyH9/RIGelJRkhz0XnXaoRSXGqrVYlGa0h+1p08wj
 HdDbxtzf7mwTjYGAOiSG1Iq/iO3UwI5pvEaiJD8F+G7WAMD//GA1WuWb8TLttRJNWO
 rbgd3Rs+Si3uwTfnnPpxh3Rc9JzaXSGwbSJQ+2HY=
Received: by mail-ej1-f54.google.com with SMTP id o8so21268501ejb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 00:08:52 -0700 (PDT)
X-Gm-Message-State: AOAM532KAd1RehGyJtrqdoZnbrxnK83QlDHDNlML+EfIRnhjI/UXDdL5
 IMcptHAEsRMZppl+Tp6WXYF9wDl5SbiCPND2oRE=
X-Google-Smtp-Source: ABdhPJz5Bpo4sLZx+VgODKy1nNTRF0OkATsG2D8nukSvGgRjPsORZPEEbE8mlh2UulqYR1jQq3wGmko6aeeETpH/EZQ=
X-Received: by 2002:a17:907:724f:: with SMTP id
 ds15mr3277198ejc.119.1600758530722; 
 Tue, 22 Sep 2020 00:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200921210233.21449-1-krzk@kernel.org>
 <20200921210610.GA5338@amd>
In-Reply-To: <20200921210610.GA5338@amd>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 22 Sep 2020 09:08:37 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdwQc86H-S=C4v_1VCbd7RhC2Soepj_2LqG1e_E_bgAug@mail.gmail.com>
Message-ID: <CAJKOXPdwQc86H-S=C4v_1VCbd7RhC2Soepj_2LqG1e_E_bgAug@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: move Milo Kim to credits
To: Pavel Machek <pavel@ucw.cz>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-iio@vger.kernel.org, linux-pm@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 linux-leds@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Sep 2020 at 23:06, Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > Milo Kim's email in TI bounces with permanent error (550: Invalid
> > recipient).  Last email from him on LKML was in 2017.  Move Milo Kim to
> > credits and remove the separate driver entries for:
> >
> >  - TI LP855x backlight driver,
> >  - TI LP8727 charger driver,
> >  - TI LP8788 MFD (ADC, LEDs, charger and regulator) drivers.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> I believe normal way would be to mark the entries "orphaned", not to
> drop them altogether. Plus, I believe someone from TI is likely to
> step up.

These are entries for specific drivers so they are covered by the
subsystem maintainers. You believe someone will step up, I believe if
these were important for TI, they would find the person some time ago,
so the emails won't bounce... This was similar with BQ chargers where
Andrew's email was bouncing and after a few weeks it was fixed. To me
it looks like TI does not have any priority in maintaining separate
driver entries so what is the point to keep orphaned driver-entry? It
is not the case where we have an orphaned subsystem and we look for a
person to handle it...

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
