Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A04987A4E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 14:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160AF6EDFE;
	Fri,  9 Aug 2019 12:38:27 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A056D6EDFE
 for <dri-devel@freedesktop.org>; Fri,  9 Aug 2019 12:38:25 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17943170-1500050 for multiple; Fri, 09 Aug 2019 13:38:17 +0100
MIME-Version: 1.0
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <156535193145.29541.1781677832750655785@skylake-alporthouse-com>
References: <20190809113030.2547-1-lionel.g.landwerlin@intel.com>
 <20190809113030.2547-2-lionel.g.landwerlin@intel.com>
 <156535193145.29541.1781677832750655785@skylake-alporthouse-com>
Message-ID: <156535429437.29541.13659336420068462858@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v4 1/1] drm/syncobj: add sideband payload
Date: Fri, 09 Aug 2019 13:38:14 +0100
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

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDgtMDkgMTI6NTg6NTEpCj4gUXVvdGluZyBMaW9u
ZWwgTGFuZHdlcmxpbiAoMjAxOS0wOC0wOSAxMjozMDozMCkKPiA+ICsgICAgICAgICAgICAgICBp
ZiAoZmxhZ3MgJiBJOTE1X0RSTV9TWU5DT0JKX0JJTkFSWV9JVEVNX1ZBTFVFX1JFQUQpIHsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIGNvcHlfdG9fdXNlcigmdmFsdWVzW2ldLCAmc3luY29i
anNbaV0tPmJpbmFyeV9wYXlsb2FkLCBzaXplb2YodmFsdWVzW2ldKSk7Cj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICByZXQgPSByZXQgPyAtRUZBVUxUIDogMDsKPiAKPiBNb3JlIG1hZ2ljLgo+
IAo+IGlmIChwdXRfdXNlcigmc3luY29ianNbaV0tPmJpbmFyeV9wYXlsb2FkLCAmdmFsdWVzW2ld
KSkKPiAgICAgICAgIHJldHVybiAtRUZBVUxUOwoKKGJyZWFrIG5vdCB5ZXQpCgpTaG91bGQganVz
dCBiZSBwdXRfdXNlcihzeW5jb2Jqc1tpXS0+YmluYXJ5X3BheWxvYWQsICZ2YWx1ZXNbaV0pClRo
ZSB2YWx1ZSBvZiwgbm90IGl0cyBhZGRyZXNzLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
