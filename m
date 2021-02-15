Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B2831B603
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 09:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421B26E107;
	Mon, 15 Feb 2021 08:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6416E107
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 08:52:44 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id w4so5477890wmi.4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 00:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=uKS+Djquue+LfyedBxvXt9cVVOP7cKVsEq1hWOM8/vw=;
 b=jYg060gKSWt358ST2fmYuHV8DpNAJXRWYerutXv0eEjyiL0Ka3jDeQN/sNUhvqs48Q
 SQEoWnwFYESI3wDaZz0v6kdy0uPVCiVl82s3GL9DzLanLKcsVP73Wh/8F2ElY3WoViot
 4aeCUbwU0W+2oVJvubEalXgmO/cHQClK1LMvwWj3no/Qi3NsH7bpbENxklgVWyURjdP+
 Ro2Ev5GbeRvvTi6B1Hadu80eZtbsfJROWzReZCUPa+Qd84TzKgbdK1n5DqxWC2/TUMYt
 2SHUgMcJKUSSq941TgCzCLepCZ7eP9UGBKuW8rJrYDh0c1kbNyPn/CYmofg6R70jAPEY
 BKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uKS+Djquue+LfyedBxvXt9cVVOP7cKVsEq1hWOM8/vw=;
 b=kWyjOT0HeYjMKJnyfqHMHYM7U4JO4q3Fe6AvXiV+B/STgzLHESevvvPTsN0iXNssje
 Yzcf0sUBnKpn0OJD72S/p2fp13Mrcpz1K4CZY6kXqePg10vfK6sn8+9LLypPVizMpurB
 9bhuvc3BxlH/y7W8FRFaldUl4LYOFbDjcs9kQGr4Ci93/+rYWcFwbrOTVaA0Aa30tq71
 iCfYxAGTOHU4APMTv7wXXlQlb9v/kc9Qlrqp+FeVraCeLT9uc5r0C4ICKny4qFc2aHzp
 VLI8hL5NkWz8UIKdwJZE5GWbej0D4MF3MdUVvjROiTGklsQD4vx5KF1jQjosVYGF1Haz
 WnXg==
X-Gm-Message-State: AOAM532CxWBIuprcOrlXSXNBZj4bzjaa6/eW1rQPPQ4jqoBUrc/Wf1OX
 +Lo6BNJzsvsDI1nxSW4o5T79FQ==
X-Google-Smtp-Source: ABdhPJyBhnjYaHKKbEfnlUU0rpoWpGgWVScJOAenfp2X7EhRm7SH+e1L0eehd3cBdyFbEZGBA2K05w==
X-Received: by 2002:a05:600c:1991:: with SMTP id
 t17mr8399158wmq.118.1613379163409; 
 Mon, 15 Feb 2021 00:52:43 -0800 (PST)
Received: from dell ([91.110.221.146])
 by smtp.gmail.com with ESMTPSA id a84sm24586107wme.12.2021.02.15.00.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 00:52:43 -0800 (PST)
Date: Mon, 15 Feb 2021 08:52:41 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4] MAINTAINERS: move Milo Kim to credits
Message-ID: <20210215085241.GG179940@dell>
References: <20210212163229.68270-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210212163229.68270-1-krzk@kernel.org>
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
 Jonathan Cameron <jic23@kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMiBGZWIgMjAyMSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKCj4gTWlsbyBL
aW0ncyBlbWFpbCBpbiBUSSBib3VuY2VzIHdpdGggcGVybWFuZW50IGVycm9yICg1NTA6IEludmFs
aWQKPiByZWNpcGllbnQpLiAgTGFzdCBlbWFpbCBmcm9tIGhpbSBvbiBMS01MIHdhcyBpbiAyMDE3
LiAgTW92ZSBNaWxvIEtpbSB0bwo+IGNyZWRpdHMgYW5kIHJlbW92ZSB0aGUgc2VwYXJhdGUgZHJp
dmVyIGVudHJpZXMgZm9yOgo+ICAtIFRJIExQODU1eCBiYWNrbGlnaHQgZHJpdmVyLAo+ICAtIFRJ
IExQODcyNyBjaGFyZ2VyIGRyaXZlciwKPiAgLSBUSSBMUDg3ODggTUZEIChBREMsIExFRHMsIGNo
YXJnZXIgYW5kIHJlZ3VsYXRvcikgZHJpdmVycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gQ2M6IE1hcmsgQnJvd24gPGJyb29uaWVA
a2VybmVsLm9yZz4KPiBDYzogSm9uYXRoYW4gQ2FtZXJvbiA8Sm9uYXRoYW4uQ2FtZXJvbkBodWF3
ZWkuY29tPgo+IENjOiBKaW5nb28gSGFuIDxqaW5nb29oYW4xQGdtYWlsLmNvbT4KPiBDYzogTGVl
IEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiBDYzogUGF2ZWwgTWFjaGVrIDxwYXZlbEB1
Y3cuY3o+Cj4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+Cj4g
Q2M6IFNlYmFzdGlhbiBSZWljaGVsIDxzcmVAa2VybmVsLm9yZz4KPiBDYzogRGFuaWVsIFRob21w
c29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KPiAKPiAtLS0KPiAKPiBEZWFyIExlZSwK
PiAKPiBDb3VsZCB5b3UgdGFrZSBjYXJlIGFib3V0IHRoaXMgcGF0Y2g/CgpZZXMsIGJ1dCBJJ2xs
IGJlIHNlbmRpbmcgb3V0IG15IHB1bGwtcmVxdWVzdCBmb3IgdjUuMTIgaW4gdGhlIG5leHQKY291
cGxlIG9mIGRheXMgKG1heWJlIGV2ZW4gdG9kYXkgaWYgSSBjYW4gZmluZCBzb21lIHRpbWUpLCBz
byB0aGlzCndpbGwgaGF2ZSB0byB3YWl0IHVudGlsIHY1LjEzLgoKLS0gCkxlZSBKb25lcyBb5p2O
55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJv
Lm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86
IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
