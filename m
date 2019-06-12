Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C06342977
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 16:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F36895C8;
	Wed, 12 Jun 2019 14:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A65B895C4;
 Wed, 12 Jun 2019 14:36:47 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16877740-1500050 for multiple; Wed, 12 Jun 2019 15:36:42 +0100
MIME-Version: 1.0
To: Patchwork <patchwork@emeril.freedesktop.org>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190612140750.21002.23346@emeril.freedesktop.org>
References: <20190612132830.31221-1-chris@chris-wilson.co.uk>
 <20190612140750.21002.23346@emeril.freedesktop.org>
Message-ID: <156035020151.27443.1099371310976976811@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: =?utf-8?q?Re=3A_=E2=9C=97_Fi=2ECI=2ESPARSE=3A_warning_for_dma-fence/reser?=
 =?utf-8?q?vation=3A_Markup_rcu_protected_access_for_DEBUG=5FMUTEXES?=
Date: Wed, 12 Jun 2019 15:36:41 +0100
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBQYXRjaHdvcmsgKDIwMTktMDYtMTIgMTU6MDc6NTApCj4gPT0gU2VyaWVzIERldGFp
bHMgPT0KPiAKPiBTZXJpZXM6IGRtYS1mZW5jZS9yZXNlcnZhdGlvbjogTWFya3VwIHJjdSBwcm90
ZWN0ZWQgYWNjZXNzIGZvciBERUJVR19NVVRFWEVTCj4gVVJMICAgOiBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzYxOTYzLwo+IFN0YXRlIDogd2FybmluZwo+IAo+ID09
IFN1bW1hcnkgPT0KPiAKPiAkIGRpbSBzcGFyc2Ugb3JpZ2luL2RybS10aXAKPiBTcGFyc2UgdmVy
c2lvbjogdjAuNS4yCj4gQ29tbWl0OiBkbWEtZmVuY2UvcmVzZXJ2YXRpb246IE1hcmt1cCByY3Ug
cHJvdGVjdGVkIGFjY2VzcyBmb3IgREVCVUdfTVVURVhFUwo+IC0uL2luY2x1ZGUvbGludXgvcmVz
ZXJ2YXRpb24uaDoyMjA6MjA6IHdhcm5pbmc6IGRlcmVmZXJlbmNlIG9mIG5vZGVyZWYgZXhwcmVz
c2lvbgpbc25pcF0KPiAtLi9pbmNsdWRlL2xpbnV4L3Jlc2VydmF0aW9uLmg6MjIwOjQ1OiB3YXJu
aW5nOiBkZXJlZmVyZW5jZSBvZiBub2RlcmVmIGV4cHJlc3Npb24KPiAtLi9pbmNsdWRlL2xpbnV4
L3Jlc2VydmF0aW9uCgpUaGF0J2xsIGNoZWVyIHVwIHNvbWUgb2YgdGhlIHdhcm5pbmdzIENJIHBl
cmlvZGljYWxseSBzZW5kcy4KVGhhbmtzIGZvciB0aGUgcXVpY2sgcmV2aWV3LAotQ2hyaXMKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
