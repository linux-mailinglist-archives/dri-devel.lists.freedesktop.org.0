Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 197DC31BAE7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 15:22:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487346E05C;
	Mon, 15 Feb 2021 14:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D7D6E05C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 14:22:19 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v15so9114956wrx.4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 06:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=cNvVdIdxlGj+Sfuamem72Qeix0oXAhgklbIFT61Vzrw=;
 b=bmcYji8KmCDbksc8hp2MPVH5eDhkXRgtiRRfCRq6DoX2SEzAHyOlzQ8MimKicYZ9xC
 7T87ysTFuAlWQw/+jY0Gid3ydZ+2hT460y3G8h1X2uC2a78MZckm5G4Noz+gW+rkep05
 lVKA9dNP2HfcTsfjRTtZvbrLf5wmJAOZE4k+2Dh5baeQhavOwAiNWxaC6o6QaM9+8zP/
 54JW0GJMfUMwO2nQg8Py25NO45SApbJ8njSeJ1SDZgXnhEmwi6VtSn2qwARAwFplSZgV
 KZrsU//AhVGco7TlybPeYe9+BZSj0rvHalZIUlQ4kyX3keUE81D19FNWvFN39+PVh+bZ
 YcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cNvVdIdxlGj+Sfuamem72Qeix0oXAhgklbIFT61Vzrw=;
 b=pygqbdN7P+Es4V/lvD15axBicmZeMVmgOMsgg3vDJtpap7SnREOL5oiiE+hapZ+YXu
 Ksrf7D5EdFSSsd44nGw8YDo8lHrhpqIW2O0JKclg1I96F6HzzJgQK93ud4Q1fGwbmPd5
 gZNibFR7ApNzrvEbm+6CnI0WEzHdFQE5RkNL3WW6HdGqUw8g7+K1M+g/q5F2jtZAl/Xb
 QhJfftCc5p5YYsH1kGFlgj79exZfnKQYVTiBW1+Bg0mQvZWMk8UczU7wo2Vzvbe37Qes
 qMaKdyR2r9/i3WQ4r8F9xaZ8ZXKOZGmDvjD0ckA1tu3ugcis5MJUglGzVSO3KnEmVIiL
 nPkQ==
X-Gm-Message-State: AOAM533AQQIGUDCjjNUYe8JyyIO/MPgitGdA1L2BhgP5YntF/B37XW5I
 Bw0jNFa4ES3wHsatJDPK468WV0OKxilyFA==
X-Google-Smtp-Source: ABdhPJyvLoPzpqgceTkmdirn2jBoo7kyNUoI9xyniMGSW3yxHYUlh/mGG05y681DGTzNHzaIx7MD9w==
X-Received: by 2002:adf:fc4c:: with SMTP id e12mr19808318wrs.106.1613398938553; 
 Mon, 15 Feb 2021 06:22:18 -0800 (PST)
Received: from dell ([91.110.221.146])
 by smtp.gmail.com with ESMTPSA id f14sm17218090wmg.28.2021.02.15.06.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 06:22:18 -0800 (PST)
Date: Mon, 15 Feb 2021 14:22:16 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v4] MAINTAINERS: move Milo Kim to credits
Message-ID: <20210215142216.GA4770@dell>
References: <20210212163229.68270-1-krzk@kernel.org>
 <20210215085241.GG179940@dell>
 <CACvgo53wn84G8wuyF++=bwtjnVzVB31BA2_JBWnihnwinSFD7A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo53wn84G8wuyF++=bwtjnVzVB31BA2_JBWnihnwinSFD7A@mail.gmail.com>
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
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-leds@vger.kernel.org,
 Jonathan Cameron <jic23@kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxNSBGZWIgMjAyMSwgRW1pbCBWZWxpa292IHdyb3RlOgoKPiBHcmVldGluZ3MgZXZl
cnlvbmUsCj4gCj4gT24gTW9uLCAxNSBGZWIgMjAyMSBhdCAwODo1MiwgTGVlIEpvbmVzIDxsZWUu
am9uZXNAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCAxMiBGZWIgMjAyMSwgS3J6
eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+Cj4gPiA+IE1pbG8gS2ltJ3MgZW1haWwgaW4gVEkg
Ym91bmNlcyB3aXRoIHBlcm1hbmVudCBlcnJvciAoNTUwOiBJbnZhbGlkCj4gPiA+IHJlY2lwaWVu
dCkuICBMYXN0IGVtYWlsIGZyb20gaGltIG9uIExLTUwgd2FzIGluIDIwMTcuICBNb3ZlIE1pbG8g
S2ltIHRvCj4gPiA+IGNyZWRpdHMgYW5kIHJlbW92ZSB0aGUgc2VwYXJhdGUgZHJpdmVyIGVudHJp
ZXMgZm9yOgo+ID4gPiAgLSBUSSBMUDg1NXggYmFja2xpZ2h0IGRyaXZlciwKPiA+ID4gIC0gVEkg
TFA4NzI3IGNoYXJnZXIgZHJpdmVyLAo+ID4gPiAgLSBUSSBMUDg3ODggTUZEIChBREMsIExFRHMs
IGNoYXJnZXIgYW5kIHJlZ3VsYXRvcikgZHJpdmVycy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1i
eTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgo+ID4gPiBDYzogTWFyayBC
cm93biA8YnJvb25pZUBrZXJuZWwub3JnPgo+ID4gPiBDYzogSm9uYXRoYW4gQ2FtZXJvbiA8Sm9u
YXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPgo+ID4gPiBDYzogSmluZ29vIEhhbiA8amluZ29vaGFu
MUBnbWFpbC5jb20+Cj4gPiA+IENjOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+
ID4gPiBDYzogUGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+Cj4gPiA+IENjOiBUaGllcnJ5IFJl
ZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgo+ID4gPiBDYzogU2ViYXN0aWFuIFJlaWNo
ZWwgPHNyZUBrZXJuZWwub3JnPgo+ID4gPiBDYzogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhv
bXBzb25AbGluYXJvLm9yZz4KPiA+ID4KPiA+ID4gLS0tCj4gPiA+Cj4gPiA+IERlYXIgTGVlLAo+
ID4gPgo+ID4gPiBDb3VsZCB5b3UgdGFrZSBjYXJlIGFib3V0IHRoaXMgcGF0Y2g/Cj4gPgo+ID4g
WWVzLCBidXQgSSdsbCBiZSBzZW5kaW5nIG91dCBteSBwdWxsLXJlcXVlc3QgZm9yIHY1LjEyIGlu
IHRoZSBuZXh0Cj4gPiBjb3VwbGUgb2YgZGF5cyAobWF5YmUgZXZlbiB0b2RheSBpZiBJIGNhbiBm
aW5kIHNvbWUgdGltZSksIHNvIHRoaXMKPiA+IHdpbGwgaGF2ZSB0byB3YWl0IHVudGlsIHY1LjEz
Lgo+ID4KPiBXb3VsZCBpdCBtYWtlIHNlbnNlIHRvIGtlZXAgdGhlIE1BSU5UQUlORVJTIGVudHJp
ZXMgYXMgIm9ycGhhbiI/Cj4gQ2hlY2tpbmcgd2l0aCBsaW51eC1uZXh0LCB0aGUgZHJpdmVycyBh
cmUgc3RpbGwgcHJlc2VudCBpbi10cmVlLgoKUGxlYXNlIHNlZToKCiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTM3OTAxNi8KCi0tIApMZWUgSm9uZXMgW+adjueQvOaW
r10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg
4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNl
Ym9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
