Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5683D2EF961
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF4489836;
	Fri,  8 Jan 2021 20:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FB489199;
 Fri,  8 Jan 2021 20:39:52 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id r9so10890429otk.11;
 Fri, 08 Jan 2021 12:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iac5XmZ0aSrPS3x4buC8VUJtjwj44d0E1FKt4htO0mc=;
 b=HCXOX5LQSKc9wfoXyQF3/5NqcGdNl4Axz0ovvQqyj6BWLBT0FYt2ARefLwylGulsmv
 9W1TgXQ7BoXD+VtEohi2qrje+a34upCTUiEPZhUbq/cJxBcm3N7ONmZI2I+0YWBP6SmN
 p3ffNs35srwJf8PrWLXssWyImz4o98fJPfExrWDtPmQxoo/s6hkf3tpAyIqo/Vu/ICZC
 hWKqsWdBLlOW9E4VutNpmsTDgd6uZtV95f2Led0rcUmJudz5QoO4H+Be2EvIHe9AhzO3
 yOj7lC/RPToR3aW4DB66gEeKV7gT8VY7qUXWkf0hB+OQP+QPkxbj0gQRjXPKFCnoquln
 nGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iac5XmZ0aSrPS3x4buC8VUJtjwj44d0E1FKt4htO0mc=;
 b=kGzaC1fDxTc+VRA4Sa6JM6kGSXcIsAH5QpURs5ygC6OuYiqimeU+Dy6btiRLVuLyeB
 uik+re+WPHt4OjJWO0XZmzcqqob+Ti95fyLFXxni9O/Y6pSw71aKChDPt6dvVX3qSw8E
 EKsWDa6tQCws71aSefWDjUn+v/9OQ+aXkhTuGRI13rmHp8d5U36TYiVEp2gCbKYgYE6D
 y+PZ/tExUrFv31jksUoJbfhrWN3hicZ8HAz346DAZbTD3S0o64Lgsbqam2uLiOiF/l+e
 Hj4m4GTAFX5DQSGyJQH3a7ucYPxfRwI7Tdx4JlRk0KlH4thX5zPGEbjujuAd+EQ+xMfj
 dweA==
X-Gm-Message-State: AOAM5312jkr9DwZ3o6xSt7yz5mrYs3FSNvlzvJnJ7VCSrewlUgPKZqpp
 USao4rn5Ve1ipLYbFCZBr2t7HIOoiTffNcG+GZk=
X-Google-Smtp-Source: ABdhPJxGTk80mgwAzb1wy8whX7yzl4+b5mretNLGSn18GjLOVwMurYgzStVlo5sqtojIZQZSIGyfqYYhRZhlk4tB8Fo=
X-Received: by 2002:a05:6830:1d66:: with SMTP id
 l6mr3802145oti.23.1610138391838; 
 Fri, 08 Jan 2021 12:39:51 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-16-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-16-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 15:39:40 -0500
Message-ID: <CADnq5_Odv9EXFfi5TGVDrdDnLrtJs4sH4E4Om-oFw4TsLdBV8w@mail.gmail.com>
Subject: Re: [PATCH 15/40] drm/amd/display/dc/bios/command_table_helper: Fix
 kernel-doc formatting
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
Cc: Leo Li <sunpeng.li@amd.com>, Mauro Rossi <issor.oruam@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIEZyaSwgSmFuIDgsIDIwMjEgYXQgMzoxNSBQTSBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xs
b3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvYmlvcy9jb21tYW5kX3RhYmxlX2hlbHBlci5jOjEzMTog
d2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAndCcgbm90IGRlc2NyaWJlZCBp
biAnZGFsX2NtZF90YWJsZV9oZWxwZXJfdHJhbnNtaXR0ZXJfYnBfdG9fYXRvbScKPgo+IENjOiBI
YXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiBDYzogTGVvIExpIDxzdW5w
ZW5nLmxpQGFtZC5jb20+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBNYXVybyBSb3NzaSA8aXNzb3Iub3J1YW1AZ21haWwu
Y29tPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9u
ZXNAbGluYXJvLm9yZz4KPiAtLS0KPiAgLi4uL2Rpc3BsYXkvZGMvYmlvcy9jb21tYW5kX3RhYmxl
X2hlbHBlci5jICAgIHwgMjAgKysrKysrKystLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9jb21tYW5kX3RhYmxlX2hlbHBlci5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvY29tbWFuZF90YWJsZV9oZWxwZXIuYwo+
IGluZGV4IDQ4YjRlZjAzZmM4ZjguLjViNzcyNTFlMDU5MDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvY29tbWFuZF90YWJsZV9oZWxwZXIuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2NvbW1hbmRfdGFibGVfaGVs
cGVyLmMKPiBAQCAtMTE0LDE4ICsxMTQsMTQgQEAgYm9vbCBkYWxfY21kX3RhYmxlX2hlbHBlcl9j
b250cm9sbGVyX2lkX3RvX2F0b20oCj4gIH0KPgo+ICAvKioKPiAtKiB0cmFuc2xhdGVfdHJhbnNt
aXR0ZXJfYnBfdG9fYXRvbQo+IC0qCj4gLSogQGJyaWVmCj4gLSogIFRyYW5zbGF0ZSB0aGUgVHJh
bnNtaXR0ZXIgdG8gdGhlIGNvcnJlc3BvbmRpbmcgQVRPTSBCSU9TIHZhbHVlCj4gLSoKPiAtKiBA
cGFyYW0KPiAtKiAgIGlucHV0IHRyYW5zbWl0dGVyCj4gLSogICBvdXRwdXQgZGlnaXRhbFRyYW5z
bWl0dGVyCj4gLSogICAgLy8gPTAwOiBEaWdpdGFsIFRyYW5zbWl0dGVyMSAoIFVOSVBIWSBsaW5r
QUIgKQo+IC0qICAgIC8vID0wMTogRGlnaXRhbCBUcmFuc21pdHRlcjIgKCBVTklQSFkgbGlua0NE
ICkKPiAtKiAgICAvLyA9MDI6IERpZ2l0YWwgVHJhbnNtaXR0ZXIzICggVU5JUEhZIGxpbmtFRiAp
Cj4gLSovCj4gKyAqIHRyYW5zbGF0ZV90cmFuc21pdHRlcl9icF90b19hdG9tIC0gVHJhbnNsYXRl
IHRoZSBUcmFuc21pdHRlciB0byB0aGUKPiArICogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb3JyZXNwb25kaW5nIEFUT00gQklPUyB2YWx1ZQo+ICsgKiBAdDogdHJhbnNtaXR0
ZXIKPiArICogcmV0dXJuczogb3V0cHV0IGRpZ2l0YWxUcmFuc21pdHRlcgo+ICsgKiAgICAvLyA9
MDA6IERpZ2l0YWwgVHJhbnNtaXR0ZXIxICggVU5JUEhZIGxpbmtBQiApCj4gKyAqICAgIC8vID0w
MTogRGlnaXRhbCBUcmFuc21pdHRlcjIgKCBVTklQSFkgbGlua0NEICkKPiArICogICAgLy8gPTAy
OiBEaWdpdGFsIFRyYW5zbWl0dGVyMyAoIFVOSVBIWSBsaW5rRUYgKQo+ICsgKi8KPiAgdWludDhf
dCBkYWxfY21kX3RhYmxlX2hlbHBlcl90cmFuc21pdHRlcl9icF90b19hdG9tKAo+ICAgICAgICAg
ZW51bSB0cmFuc21pdHRlciB0KQo+ICB7Cj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlz
dAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
