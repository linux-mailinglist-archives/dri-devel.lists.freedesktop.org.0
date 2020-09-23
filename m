Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B1C276191
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 22:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1C46E9F6;
	Wed, 23 Sep 2020 20:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FFA6E9F6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 20:01:53 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 415E6206DB;
 Wed, 23 Sep 2020 20:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600891312;
 bh=lacwpEnhW0VmojT8XZbUMWQowrObz8O29NKZ1igg/kw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2d6Ym4AK/j0nrTc0JFBxZFw/lBa4dzWDfLWIDSJkqNZyyr6Y2LqnJdVpmfh4Cr0wS
 1OoMmB6a789Vbvk/bM8U3ONdgEeBGAUzpSnn87ReKHDBx4lkkduT6nY/zUl4GUyxlF
 VxlUyWCxSxY83kQC/QRpUy75LYJ8erGuJusDEWcY=
Date: Wed, 23 Sep 2020 21:01:45 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2] MAINTAINERS: add Dan Murphy as TP LP8xxx drivers
 maintainer
Message-ID: <20200923205857.5af407ee@archlinux>
In-Reply-To: <fe4609b5-5aab-46ed-5280-9a4742b97fe5@ti.com>
References: <20200922152839.2744-1-krzk@kernel.org>
 <fe4609b5-5aab-46ed-5280-9a4742b97fe5@ti.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
 Sebastian Reichel <sre@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Sep 2020 11:53:33 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> Hello
> 
> On 9/22/20 10:28 AM, Krzysztof Kozlowski wrote:
> > Milo Kim's email in TI bounces with permanent error (550: Invalid
> > recipient).  Last email from him on LKML was in 2017.  Move Milo Kim to
> > credits and add Dan Murphy from TI to look after:
> >   - TI LP855x backlight driver,
> >   - TI LP8727 charger driver,
> >   - TI LP8788 MFD (ADC, LEDs, charger and regulator) drivers.
> >
> > Cc: Dan Murphy <dmurphy@ti.com>
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>  
> 
> Acked-by: Dan Murphy <dmurphy@ti.com>
> 
Not sure who will pick this one up, but
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
