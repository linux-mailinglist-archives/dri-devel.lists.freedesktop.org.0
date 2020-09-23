Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F667276A8D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 09:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588556EAB9;
	Thu, 24 Sep 2020 07:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD57D6E97A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 16:53:36 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08NGrYUc073873;
 Wed, 23 Sep 2020 11:53:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600880014;
 bh=v/OdQtLrwg8yFHMiXDvciypEO6WxHuaqhFeT3aUYHVk=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=bPXmP2CUn6HstssqRQAJHuvz8dGAJpgOb44WcJiChOvDH5JjqhtpWwfpiqSfRM3Pw
 pa0uVcKlGFPxYYoMhQMmlLsSOiqovFxNpf+k/wp06OeNuSt03GhjMTxwMOle+5eVV3
 CTu99N+bQ8HczmerxJF38khSQ3FO4mQuVekEsCmI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08NGrYso032957
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Sep 2020 11:53:34 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 23
 Sep 2020 11:53:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 23 Sep 2020 11:53:34 -0500
Received: from [10.250.36.88] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08NGrXwg008341;
 Wed, 23 Sep 2020 11:53:33 -0500
Subject: Re: [PATCH v2] MAINTAINERS: add Dan Murphy as TP LP8xxx drivers
 maintainer
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Jonathan Cameron <jic23@kernel.org>, Lee Jones
 <lee.jones@linaro.org>, Sebastian Reichel <sre@kernel.org>, Bartlomiej
 Zolnierkiewicz <b.zolnierkie@samsung.com>, <linux-iio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 <linux-leds@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>
References: <20200922152839.2744-1-krzk@kernel.org>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <fe4609b5-5aab-46ed-5280-9a4742b97fe5@ti.com>
Date: Wed, 23 Sep 2020 11:53:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922152839.2744-1-krzk@kernel.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 24 Sep 2020 07:19:09 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello

On 9/22/20 10:28 AM, Krzysztof Kozlowski wrote:
> Milo Kim's email in TI bounces with permanent error (550: Invalid
> recipient).  Last email from him on LKML was in 2017.  Move Milo Kim to
> credits and add Dan Murphy from TI to look after:
>   - TI LP855x backlight driver,
>   - TI LP8727 charger driver,
>   - TI LP8788 MFD (ADC, LEDs, charger and regulator) drivers.
>
> Cc: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Dan Murphy <dmurphy@ti.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
