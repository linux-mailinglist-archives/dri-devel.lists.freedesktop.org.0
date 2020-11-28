Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BBF2C6F5D
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 10:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14936EC59;
	Sat, 28 Nov 2020 09:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D07F6EC59
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 09:00:22 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D18922272
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 09:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606554021;
 bh=tCh3C64HLBruiQe7woUJh3PomiEkJaLuMsK2cYyZ3AE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=f0Th5J3kNwanqwLrsUfcFVjKjBzG0T5dTMjmemdj2OHzf3R85LAQ5cvSp9donQn1q
 Da3O0EVQmMoPGwAkX8Q7/8OWXsu2pcL9ecIE8qQkDssINevLLPWWAEDfpQLrs9VO9q
 k0G2OrM0FzU/FxBRyGq71l4ts5SlyrbXAPQ5itYs=
Received: by mail-wr1-f52.google.com with SMTP id g14so7938791wrm.13
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 01:00:21 -0800 (PST)
X-Gm-Message-State: AOAM533w+JYycy5DVh5uQ/5Q2yzvoC5dDika+3lWza8eWA2c/ggoEanR
 V+hBvl12aFJtvCSbM7v5oVyi0suuWdoRYOMZsw==
X-Google-Smtp-Source: ABdhPJwaGpEa4Ug6G0e4ekBFpVOFIur24PSU0U73IWrhh0O8+yKHfKhXm6k7CY8fPX51ghX7CTQgvKr1wmwXSEjAldg=
X-Received: by 2002:adf:c147:: with SMTP id w7mr16556337wre.60.1606554020099; 
 Sat, 28 Nov 2020 01:00:20 -0800 (PST)
MIME-Version: 1.0
References: <20201127110204.1984789-1-enric.balletbo@collabora.com>
In-Reply-To: <20201127110204.1984789-1-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 28 Nov 2020 17:00:08 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9udVi7s5HoB+4SMNsTRQp9WPnHXLhz8b0CCWzW73BNSw@mail.gmail.com>
Message-ID: <CAAOTY_9udVi7s5HoB+4SMNsTRQp9WPnHXLhz8b0CCWzW73BNSw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Use correct aliases name for ovl
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQxMeaciDI35pelIOmAseS6lCDkuIvljYg3OjAy5a+r6YGT77ya
Cj4KPiBBbGlhc2VzIHByb3BlcnR5IG5hbWUgbXVzdCBpbmNsdWRlIG9ubHkgbG93ZXJjYXNlIGFu
ZCAnLScsIHNvIGZpeCB0aGlzCj4gaW4gdGhlIGRyaXZlciwgc28gd2UncmUgbm90IHRlbXB0ZWQg
dG8gZG8gIm92bF8ybDAgPSAmb3ZsXzJsMCIgaW4gdGhlCj4gZGV2aWNlLXRyZWUgaW5zdGVhZCBv
ZiB0aGUgcmlnaHQgb25lIHdoaWNoIGlzICJvdmwtMmwwID0gJm92bF8ybDAiLgo+CgpBcHBsaWVk
IHRvIG1lZGlhdGVrLWRybS1uZXh0IFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9n
Lz9oPW1lZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiBGaXhlczogZGQ4
ZmViMjI2MmQ5ICgiZHJtL21lZGlhdGVrOiBhZGQgY29tcG9uZW50IE9WTF8yTDEiKQo+IEZpeGVz
OiBiMTdiZGQwZDdhNzMgKCJkcm0vbWVkaWF0ZWs6IGFkZCBjb21wb25lbnQgT1ZMXzJMMCIpCj4g
U2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29s
bGFib3JhLmNvbT4KPiAtLS0KPgo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHBfY29tcC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHBfY29tcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAu
Ywo+IGluZGV4IDhlYmE0NGJlM2E4YS4uMzA2NGVhYzFhNzUwIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gQEAgLTM1OSw3ICszNTksNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBfY29tcF9mdW5jcyBkZHBfdWZvZSA9IHsKPgo+ICBz
dGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IG10a19kZHBfY29tcF9zdGVtW01US19ERFBfQ09NUF9U
WVBFX01BWF0gPSB7Cj4gICAgICAgICBbTVRLX0RJU1BfT1ZMXSA9ICJvdmwiLAo+IC0gICAgICAg
W01US19ESVNQX09WTF8yTF0gPSAib3ZsXzJsIiwKPiArICAgICAgIFtNVEtfRElTUF9PVkxfMkxd
ID0gIm92bC0ybCIsCj4gICAgICAgICBbTVRLX0RJU1BfUkRNQV0gPSAicmRtYSIsCj4gICAgICAg
ICBbTVRLX0RJU1BfV0RNQV0gPSAid2RtYSIsCj4gICAgICAgICBbTVRLX0RJU1BfQ09MT1JdID0g
ImNvbG9yIiwKPiAtLQo+IDIuMjkuMgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
