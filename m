Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5AA2EF94B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5D96E8C4;
	Fri,  8 Jan 2021 20:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16146E8C4;
 Fri,  8 Jan 2021 20:35:45 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id l200so12747729oig.9;
 Fri, 08 Jan 2021 12:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VpvD6PG1QgANsGGyog3b6p6+OIrJWW4ly0pJuf5vMsk=;
 b=PIbDQGG2BRxwiOyEK90Lk0BubPYR57V/VUqFj8RxmDdqJke6LsBIOOq03Oi/Gr/gHH
 TeoN89C3FxdsxzFrGXozyU9917pghuw30xgk6UBavCJe0sGzqmKU7Sy4hBRNMrVpAQQu
 Yfj/vMK4a/LVFQ+MAO94MS8m5p4fn2BMp5erW9WKxUNhFVvOuDRuWXhBKMT356rNUB8e
 LFmJB7im2jdh2x/vH7iYjsXCairkQLULvBWcliHRQso8NM+usxLOk1qUsQoWl15Npewd
 JkCEHQfD24zlmsptpyOgGu9l3jz2zGYP1+xt9NsvxxUr6Bqh0oFDzO6OwNSdIG+YH9v/
 Jm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VpvD6PG1QgANsGGyog3b6p6+OIrJWW4ly0pJuf5vMsk=;
 b=JRfp9BVxiNR6mvOMNDJamy/QghLObHjWUMy7OeewRzda/OgdqJKtgnxFTT8qJOjuS/
 OcMaBrezTxt3iBocX/a6UP5Y5a127FsYED01ZC6wtznWbDcdjcMvdtfoug3s2bygOeUf
 FK7gYqdO4ePLokOvDa8/B3yZM6o/XEcVLUywJb7yr0+95FjZOz0dk/2irl198bCZjzGZ
 z6DDUpOc6IH8xIEvqobUXpwSk/AVt7vkJpQY3YsahUbJ2nGBGMRnTFbFmepVPfsWD4yJ
 UCrU0lbDbaxduSUDV24gFJQIYh67hkGcApHRp4mdCAykw88L1J5deKHnMC59YD2WC071
 F1Uw==
X-Gm-Message-State: AOAM532cFG9bxCYUwGhVLGCcj5NjQ0hZCqcLtsOOsP+3uSWcjwM7rWuC
 bv+MPd5uAyFJI/SU/gGCu6wjWM9WuBKr8SDfTmIkDPeq
X-Google-Smtp-Source: ABdhPJwXn14xtfuj2gdLw5RyaClhmPybR2Gly+0Dzu2yc1H4BC6Jhn5Z19o/OFqCXKR0/5fKCx4+2eHJr5RXg9o93tQ=
X-Received: by 2002:a54:4083:: with SMTP id i3mr3410414oii.120.1610138145109; 
 Fri, 08 Jan 2021 12:35:45 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-11-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-11-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 15:35:34 -0500
Message-ID: <CADnq5_NHXUy4s962i2bNTJFjOahGLakuS29vxziKApPkMOo1Uw@mail.gmail.com>
Subject: Re: [PATCH 10/40] drm/amd/pm/powerplay/hwmgr/smu7_hwmgr: Fix
 formatting and spelling issues
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gOCwgMjAyMSBhdCAzOjE1IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5
L2h3bWdyL3NtdTdfaHdtZ3IuYzoyNDI6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBt
ZW1iZXIgJ2h3bWdyJyBub3QgZGVzY3JpYmVkIGluICdzbXU3X2VuYWJsZV9zbWNfdm9sdGFnZV9j
b250cm9sbGVyJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBsYXkv
aHdtZ3Ivc211N19od21nci5jOjQ1MDg6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBt
ZW1iZXIgJ3VzX21heF9mYW5fcnBtJyBub3QgZGVzY3JpYmVkIGluICdzbXU3X3NldF9tYXhfZmFu
X3JwbV9vdXRwdXQnCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3Bvd2VycGxh
eS9od21nci9zbXU3X2h3bWdyLmM6NDUwODogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFt
ZXRlciAndXNNYXhGYW5ScG0nIGRlc2NyaXB0aW9uIGluICdzbXU3X3NldF9tYXhfZmFuX3JwbV9v
dXRwdXQnCj4KPiBDYzogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KPiBDYzogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5p
ZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3Jn
PgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L3BtL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMKPiBpbmRleCA4MjY3
NmMwODZjZTQ2Li5jNTdkYzlhZTgxZjJmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG0vcG93ZXJwbGF5L2h3bWdyL3NtdTdfaHdtZ3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3NtdTdfaHdtZ3IuYwo+IEBAIC0yMzUsNyArMjM1LDcg
QEAgc3RhdGljIGludCBzbXU3X2dldF9jdXJyZW50X3BjaWVfbGFuZV9udW1iZXIoc3RydWN0IHBw
X2h3bWdyICpod21ncikKPiAgLyoqCj4gICAqIHNtdTdfZW5hYmxlX3NtY192b2x0YWdlX2NvbnRy
b2xsZXIgLSBFbmFibGUgdm9sdGFnZSBjb250cm9sCj4gICAqCj4gLSAqIEBod21nciAgdGhlIGFk
ZHJlc3Mgb2YgdGhlIHBvd2VycGxheSBoYXJkd2FyZSBtYW5hZ2VyLgo+ICsgKiBAaHdtZ3I6ICB0
aGUgYWRkcmVzcyBvZiB0aGUgcG93ZXJwbGF5IGhhcmR3YXJlIG1hbmFnZXIuCj4gICAqIFJldHVy
bjogICBhbHdheXMgUFBfUmVzdWx0X09LCj4gICAqLwo+ICBzdGF0aWMgaW50IHNtdTdfZW5hYmxl
X3NtY192b2x0YWdlX2NvbnRyb2xsZXIoc3RydWN0IHBwX2h3bWdyICpod21ncikKPiBAQCAtNDUw
MSw3ICs0NTAxLDcgQEAgc3RhdGljIGludCBzbXU3X2Rpc3BsYXlfY29uZmlndXJhdGlvbl9jaGFu
Z2VkX3Rhc2soc3RydWN0IHBwX2h3bWdyICpod21ncikKPiAgICogc211N19zZXRfbWF4X2Zhbl9y
cG1fb3V0cHV0IC0gU2V0IG1heGltdW0gdGFyZ2V0IG9wZXJhdGluZyBmYW4gb3V0cHV0IFJQTQo+
ICAgKgo+ICAgKiBAaHdtZ3I6ICB0aGUgYWRkcmVzcyBvZiB0aGUgcG93ZXJwbGF5IGhhcmR3YXJl
IG1hbmFnZXIuCj4gLSAqIEB1c01heEZhblJwbTogIG1heCBvcGVyYXRpbmcgZmFuIFJQTSB2YWx1
ZS4KPiArICogQHVzX21heF9mYW5fcnBtOiAgbWF4IG9wZXJhdGluZyBmYW4gUlBNIHZhbHVlLgo+
ICAgKiBSZXR1cm46ICAgVGhlIHJlc3BvbnNlIHRoYXQgY2FtZSBmcm9tIHRoZSBTTUMuCj4gICAq
Lwo+ICBzdGF0aWMgaW50IHNtdTdfc2V0X21heF9mYW5fcnBtX291dHB1dChzdHJ1Y3QgcHBfaHdt
Z3IgKmh3bWdyLCB1aW50MTZfdCB1c19tYXhfZmFuX3JwbSkKPiAtLQo+IDIuMjUuMQo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
