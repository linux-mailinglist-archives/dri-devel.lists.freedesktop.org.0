Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BEE10C215
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 03:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59856E5E1;
	Thu, 28 Nov 2019 02:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000416E5E1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 02:01:56 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B4152071F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 02:01:56 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id m30so16879238lfp.8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 18:01:56 -0800 (PST)
X-Gm-Message-State: APjAAAV7ribVgHgeJvo1+HflWipFt8zbt/JNG2BsqSKWRSibc0m6zAxy
 koWbPd60ouoWPaLWcDEcW0g5Hdxaf0Touto95cA=
X-Google-Smtp-Source: APXvYqwf0FBRz8oMYpv9971Qt4D0VHSAYNJ0z+XlnxTZwRI2xCRXhL3jA4u6airlbfQp9bZ+tt2Vn7X/XcURdrJGA2M=
X-Received: by 2002:ac2:4469:: with SMTP id y9mr31061502lfl.33.1574906514716; 
 Wed, 27 Nov 2019 18:01:54 -0800 (PST)
MIME-Version: 1.0
References: <20191121132919.29430-1-krzk@kernel.org> <87k17lo41g.fsf@intel.com>
In-Reply-To: <87k17lo41g.fsf@intel.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 28 Nov 2019 10:01:43 +0800
X-Gmail-Original-Message-ID: <CAJKOXPdCXFgZyF8tgLmOOoVgtC++RQGSSN8LT4twEXKz=+589Q@mail.gmail.com>
Message-ID: <CAJKOXPdCXFgZyF8tgLmOOoVgtC++RQGSSN8LT4twEXKz=+589Q@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: Fix Kconfig indentation
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574906516;
 bh=NYRqSSSflb/7R2PJYKZYTmTZFfY5niNm/0KywUUvxio=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d3/F8gLLnZ4/ZaTDrULqhfAEOTrK5hqoj33SGcB2N+2GtEUIvYIk6ocWtm87pfr9E
 fUhRI1eKjGKcugyl//SD6UsJK2es6aB/IA0F3t4aovNbxWgN3HwLOLVg24lfD+oKsf
 y8gaKQpLRcHJsItyhqnQyg5roURrSg5Rcz0O6mDY=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNyBOb3YgMjAxOSBhdCAyMToxNCwgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxp
bnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIDIxIE5vdiAyMDE5LCBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gQWRqdXN0IGluZGVudGF0aW9u
IGZyb20gc3BhY2VzIHRvIHRhYiAoK29wdGlvbmFsIHR3byBzcGFjZXMpIGFzIGluCj4gPiBjb2Rp
bmcgc3R5bGUgd2l0aCBjb21tYW5kIGxpa2U6Cj4gPiAgICAgICAkIHNlZCAtZSAncy9eICAgICAg
ICAvXHQvJyAtaSAqL0tjb25maWcKPgo+IEJ0dyBoYXZlIHlvdSB1cGRhdGVkIGNoZWNrcGF0Y2gu
cGwgdG8gdHJ5IHRvIGtlZXAgdGhlIEtjb25maWdzIGZyb20KPiBiaXRyb3R0aW5nIGJhY2sgdG8g
aGF2aW5nIGRpZmZlcmVudCBpbmRlbnRhdGlvbj8gT3IgdGhlIGNvbmZpZyB0b29scz8KClBlcmwg
aXMgbm90IG15IGRvbWFpbiBidXQgSSBjYW4gdHJ5LiBMZXQncyBzZWUuLi4KCkJlc3QgcmVnYXJk
cywKS3J6eXN6dG9mCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
