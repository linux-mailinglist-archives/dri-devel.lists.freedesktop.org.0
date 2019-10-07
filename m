Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEB2CEAA3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 19:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CBD6E61D;
	Mon,  7 Oct 2019 17:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1E36E12D;
 Mon,  7 Oct 2019 17:30:07 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13DA521655;
 Mon,  7 Oct 2019 17:30:07 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id l21so14589437lje.4;
 Mon, 07 Oct 2019 10:30:06 -0700 (PDT)
X-Gm-Message-State: APjAAAW11g164FCpgSrdGTI+HI4XoTlnHXHjY1KWw5IsAjfibnhtJ2d6
 6pYUhf2bDy9ccVedqUF9dSDSj6pmniEbN96kP90=
X-Google-Smtp-Source: APXvYqwmBhQ/7r1sccn69bdteEM2oYrlVQ4Im2gzzv/FHBYneH2khccdbHlxPWXIpivEwoFLYEN1637fU1HLJrcElvg=
X-Received: by 2002:a2e:9159:: with SMTP id q25mr376354ljg.225.1570469405263; 
 Mon, 07 Oct 2019 10:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191004144549.3567-1-krzk@kernel.org> <87sgo4hjii.fsf@intel.com>
 <CADnq5_MqGehpWwOAxYg0T2x3qXisqmae2uGG5dijQX+Aa4NsoQ@mail.gmail.com>
In-Reply-To: <CADnq5_MqGehpWwOAxYg0T2x3qXisqmae2uGG5dijQX+Aa4NsoQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 7 Oct 2019 19:29:54 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeVFeSDpxPv-rDywCafWbN3mivtcM3UQX_+wZkyPcZwPQ@mail.gmail.com>
Message-ID: <CAJKOXPeVFeSDpxPv-rDywCafWbN3mivtcM3UQX_+wZkyPcZwPQ@mail.gmail.com>
Subject: Re: [PATCH TRIVIAL v2] gpu: Fix Kconfig indentation
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570469407;
 bh=7BgONx2fxTCBerkz+kZbipHG1ITh4B74FEdi9hVq484=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qWQvAQdNF/Y5LcuOkgQNFbrOYyT9zV8nGvQWGIalDCdrCIVR6/XSgL48CyNJqeOpW
 wkoJhtMz7y3IYD01mP1Wrjl9bN977MFW9mehzUiNsgxus43IHZn6NsBgmCM2nRA94W
 gP8kq+CEaHsP6v680i7rvL8uFTY1XraSbw5To80E=
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Jiri Kosina <trivial@kernel.org>, lima@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-rockchip@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCA3IE9jdCAyMDE5IGF0IDE4OjA5LCBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE9jdCA3LCAyMDE5IGF0IDc6MzkgQU0gSmFuaSBO
aWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJp
LCAwNCBPY3QgMjAxOSwgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiB3cm90
ZToKPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L0tjb25maWcgICAgICAgICAgICAgfCAgMTIg
Ky0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L0tjb25maWcuZGVidWcgICAgICAgfCAxNDQg
KysrKysrKysrKystLS0tLS0tLS0tLS0KPiA+Cj4gPiBQbGVhc2Ugc3BsaXQgdGhlc2Ugb3V0IHRv
IGEgc2VwYXJhdGUgcGF0Y2guIENhbid0IHNwZWFrIGZvciBvdGhlcnMsIGJ1dAo+ID4gdGhlIHBh
dGNoIGxvb2tzIGxpa2UgaXQnbGwgYmUgY29uZmxpY3RzIGdhbG9yZSBhbmQgYSBwcm9ibGVtIHRv
IG1hbmFnZQo+ID4gaWYgbWVyZ2VkIGluIG9uZSBiaWcgbHVtcC4KPgo+IFllcywgaXQgd291bGQg
YmUgbmljZSB0byBoYXZlIHRoZSBhbWQgcGF0Y2ggc2VwYXJhdGUgYXMgd2VsbC4KCkknbGwgc3Bs
aXQgdGhlIEFNRCBhbmQgaTkxNSBhbHRob3VnaCBJIGFtIG5vdCBzdXJlIGlmIGl0IGlzIHNlbnNl
IHRvCnNwbGl0IHN1Y2ggdHJpdmlhbCBwYXRjaCBwZXIgZWFjaCBkcml2ZXIuCgpCZXN0IHJlZ2Fy
ZHMsCktyenlzenRvZgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
