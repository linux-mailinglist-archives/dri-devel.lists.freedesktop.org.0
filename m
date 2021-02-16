Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6286931CC69
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 15:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA6B6E0F5;
	Tue, 16 Feb 2021 14:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C78C6E199
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 13:36:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00B30AC69;
 Tue, 16 Feb 2021 13:36:50 +0000 (UTC)
Message-ID: <5164bb01b7f3cf71926109a37b9e3957cfb630ba.camel@suse.de>
Subject: Re: [PATCH v5 3/3] drm: Add Generic USB Display driver
From: Oliver Neukum <oneukum@suse.de>
To: Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, 
 dri-devel@lists.freedesktop.org
Date: Tue, 16 Feb 2021 14:36:37 +0100
In-Reply-To: <20210212174609.58977-4-noralf@tronnes.org>
References: <20210212174609.58977-1-noralf@tronnes.org>
 <20210212174609.58977-4-noralf@tronnes.org>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 16 Feb 2021 14:51:14 +0000
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
Cc: hudson@trmm.net, markus@raatikainen.cc, sam@ravnborg.org,
 linux-usb@vger.kernel.org, th020394@gmail.com, lkundrak@v3.sk,
 pontus.fuchs@gmail.com, Daniel Vetter <daniel.vetter@ffwll.ch>, peter@stuge.se
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRnJlaXRhZywgZGVuIDEyLjAyLjIwMjEsIDE4OjQ2ICswMTAwIHNjaHJpZWIgTm9yYWxmIFRy
w7hubmVzOgo+ICtzdGF0aWMgdm9pZCBndWRfY29ubmVjdG9yX2Vhcmx5X3VucmVnaXN0ZXIoc3Ry
dWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiArewo+ICsgICAgICAgc3RydWN0IGd1ZF9j
b25uZWN0b3IgKmdjb25uID0gdG9fZ3VkX2Nvbm5lY3Rvcihjb25uZWN0b3IpOwo+ICsKPiArICAg
ICAgIGJhY2tsaWdodF9kZXZpY2VfdW5yZWdpc3RlcihnY29ubi0+YmFja2xpZ2h0KTsKPiArICAg
ICAgIGNhbmNlbF93b3JrX3N5bmMoJmdjb25uLT5iYWNrbGlnaHRfd29yayk7Cj4gK30KCkhpLAoK
dGhpcyBsb29rcyBsaWtlIHlvdSBhcmUgY3JlYXRpbmcgYSByYWNlIGNvbmRpdGlvbiB3aGVyZSB0
aGUgcXVldWVkIHdvcmsKbWF5IG9wZXJhdGUgb24gYW4gYWxyZWFkeSB1bnJlZ2lzdGVyZWQgYmFj
a2xpZ2h0LgoKCVJlZ2FyZHMKCQlPbGl2ZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
