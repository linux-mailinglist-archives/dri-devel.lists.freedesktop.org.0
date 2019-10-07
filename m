Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6CDCE8B6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 18:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E745C6E25D;
	Mon,  7 Oct 2019 16:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFF76E200;
 Mon,  7 Oct 2019 16:09:53 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y19so16032373wrd.3;
 Mon, 07 Oct 2019 09:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cqJ0vbvGAeolZd2vSOe/7rP/jwOR0aoF9Fh0aImNAAY=;
 b=s8B9v1t64AnbBSdFhjhfNj1aWyGJlIkg4ccRLS9aAGLruZrv+b0yr/YKC2V9muCjuL
 OjREZLOjq3jCq4+tKoCMDxI7ZSv1BL1WM8IAELjdSfJLUr4Ns734lYzv2gnmTdcpCf8l
 wfGb7zturjl/0sXyS4B98NwRVDUU4mk9kUBZ3xk9oZfMilgtRiIudHtGMkP4fCnBP+GK
 bdAMk4a8AAsKVyOeiVjnWdyXj1YTNftNPl3rWzVyvs9slheZj9Bu0RQZwtDwnOttNZbR
 8cKAuCZSq/3mVumQRAEzDz0rcghfEGRfNrwSXQyraEAijl/Xt5K1JYHOK36mf9tKNhDp
 yXaA==
X-Gm-Message-State: APjAAAU6+vLed0IU3goQXAZSyXrq30gqdWh2zvVpyvvSlDY/eeQ6ncwT
 GyF5Z24h4LTE2Hf7P9JnibsC0JuTgIRWk0yE1iE=
X-Google-Smtp-Source: APXvYqxgHqJZNgIWzKRUTN0lTc9yubZcuhBGUiP8kclFNKByTkdixaX3OZuWxl98eB2sTzFDMiLudNl4WXyL54+19BU=
X-Received: by 2002:adf:e951:: with SMTP id m17mr22737714wrn.154.1570464592558; 
 Mon, 07 Oct 2019 09:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191004144549.3567-1-krzk@kernel.org> <87sgo4hjii.fsf@intel.com>
In-Reply-To: <87sgo4hjii.fsf@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Oct 2019 12:09:40 -0400
Message-ID: <CADnq5_MqGehpWwOAxYg0T2x3qXisqmae2uGG5dijQX+Aa4NsoQ@mail.gmail.com>
Subject: Re: [PATCH TRIVIAL v2] gpu: Fix Kconfig indentation
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=cqJ0vbvGAeolZd2vSOe/7rP/jwOR0aoF9Fh0aImNAAY=;
 b=fFDyTPz/c3ABifR0uGkkFfA3T4wZKNjifQ194u3nCRCSJY4LsrTNWUeX1jcPlWprOT
 1MbCxB6ZLCVa430OOIZ454NIJujssKIzCSNwDei2E588Ha11s/YCWG6fqB/iW/sg7IDn
 EKihD2BfJp/c+a2C1d7MMJtVJ0AtgOI+Dqmo6gh7UYAKDQPfvGhnHsJ09EYKGzM+OY0M
 /2mwRPdsmLRIdWqNOFGBQOZoTlAvdt7s/xNAeCGCodT/fTDwgYd2cJsc0kUPShUL3xo6
 OpkBqoyI2EUTaQZdGRJmaAHyw7l5AOFFufhTCbCHLQj94lPqsNlBoE3sPz6oMdFbfna0
 KNrg==
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
 linux-rockchip@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgNywgMjAxOSBhdCA3OjM5IEFNIEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBs
aW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCAwNCBPY3QgMjAxOSwgS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9LY29uZmlnICAgICAgICAgICAgIHwgIDEyICstCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvS2NvbmZpZy5kZWJ1ZyAgICAgICB8IDE0NCArKysrKysrKysrKy0tLS0tLS0tLS0tLQo+Cj4g
UGxlYXNlIHNwbGl0IHRoZXNlIG91dCB0byBhIHNlcGFyYXRlIHBhdGNoLiBDYW4ndCBzcGVhayBm
b3Igb3RoZXJzLCBidXQKPiB0aGUgcGF0Y2ggbG9va3MgbGlrZSBpdCdsbCBiZSBjb25mbGljdHMg
Z2Fsb3JlIGFuZCBhIHByb2JsZW0gdG8gbWFuYWdlCj4gaWYgbWVyZ2VkIGluIG9uZSBiaWcgbHVt
cC4KClllcywgaXQgd291bGQgYmUgbmljZSB0byBoYXZlIHRoZSBhbWQgcGF0Y2ggc2VwYXJhdGUg
YXMgd2VsbC4KCkFsZXgKCj4KPiBCUiwKPiBKYW5pLgo+Cj4KPiAtLQo+IEphbmkgTmlrdWxhLCBJ
bnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
