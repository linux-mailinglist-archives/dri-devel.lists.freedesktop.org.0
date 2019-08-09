Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F0F87A76
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 14:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559546E1F6;
	Fri,  9 Aug 2019 12:49:44 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D596E1F6
 for <dri-devel@freedesktop.org>; Fri,  9 Aug 2019 12:49:43 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17943280-1500050 for multiple; Fri, 09 Aug 2019 13:49:35 +0100
MIME-Version: 1.0
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <e8887ff5-c1b4-3158-689b-28321f74ee0c@intel.com>
References: <20190809113030.2547-1-lionel.g.landwerlin@intel.com>
 <20190809113030.2547-2-lionel.g.landwerlin@intel.com>
 <156535193145.29541.1781677832750655785@skylake-alporthouse-com>
 <e8887ff5-c1b4-3158-689b-28321f74ee0c@intel.com>
Message-ID: <156535497298.29541.7460513143395468652@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v4 1/1] drm/syncobj: add sideband payload
Date: Fri, 09 Aug 2019 13:49:33 +0100
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
Cc: Christian Koenig <Christian.Koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBMaW9uZWwgTGFuZHdlcmxpbiAoMjAxOS0wOC0wOSAxMzozODo1NykKPiBPbiAwOS8w
OC8yMDE5IDE0OjU4LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBOb3QgYXRvbWljICh0aGUgdTY0
IHdyaXRlIHNob3VsZCByZWFsbHkgYmUgdG8gYXZvaWQgdG90YWwgY29ycnVwdGlvbikKPiA+IGFu
ZCBub3RoaW5nIHByZXZlbnRzIHVzZXJzcGFjZSBmcm9tIHJhY2luZy4gSG93IHNhZmUgaXMgdGhh
dCBpbiB0aGUKPiA+IG92ZXJhbGwgZGVzaWduPwo+IAo+IAo+IEF0b21pYyB3b3VsZCBwcmV2ZW50
IGlzc3VlIHJlbGF0ZWQgdG8gMiBwcm9jZXNzZXMvdGhyZWFkcyBzZWVpbmcgCj4gZGlmZmVyZW50
IHZhbHVlcyBiZWNhdXNlIG9mIGNhY2hpbmc/CgpObywgdGhlIGtlcm5lbCBhdG9taWNzIHRoZW1z
ZWx2ZXMgZG8gbm90IGd1YXJhbnRlZSBtZW1vcnkgYmFycmllcnMgaW4KYWxsIGNhc2VzLiBUaGUg
aXNzdWUgSSBzZWUgaGVyZSBpcyB0aGF0IHdlIGNhbiBub3Qgc2FmZWx5IGRvIGEgdTY0CmluY3Jl
bWVudCBvbiBhbGwgcGxhdGZvcm1zIHdpdGhvdXQgd3JpdGUgdGVhcmluZy4gRS5nLiB0d28gY2xp
ZW50cwpzaW11bHRhbmVvdXNseSBpbmNyZW1lbnRpbmcgZnJvbSBVMzJfTUFYIGJlY29tZXMgMHgx
IChib3RoIHdvdWxkIHJlcG9ydApVMzJfTUFYKQotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
