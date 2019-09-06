Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB6DAB577
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 12:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38A86E226;
	Fri,  6 Sep 2019 10:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A70989142
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 10:11:01 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1i6BCl-0008Tz-Lz; Fri, 06 Sep 2019 12:10:59 +0200
Message-ID: <ed249ddd9a37878214047fad227b7bf460da3298.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] drm/etnaviv: update hardware headers from rnndb
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 dri-devel@lists.freedesktop.org
Date: Fri, 06 Sep 2019 12:10:58 +0200
In-Reply-To: <20190906100308.15341-1-christian.gmeiner@gmail.com>
References: <20190906100308.15341-1-christian.gmeiner@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnIsIDIwMTktMDktMDYgYXQgMTI6MDMgKzAyMDAsIENocmlzdGlhbiBHbWVpbmVyIHdyb3Rl
Ogo+IFVwZGF0ZSB0aGUgc3RhdGUgSEkgYW5kIGNvbW1vbiBoZWFkZXIgZnJvbSBybm5kYiBjb21t
aXQKPiBhMDQyODM1OTFhOGEgKHJubmRiOiB1cGRhdGUgTU1VIGV4Y2VwdGlvbiBjYXVzZXMpLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBn
bWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L3N0YXRlLnhtbC5oICAg
ICB8ICAgMzcgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvc3RhdGVfM2QueG1sLmggIHwg
MTg0OSArKysrKysrKysrKysrKysrKysrKysrLQoKSSdtIG5vdCBhIGZhbiBvZiBwdWxsaW5nIGlu
IHRoZSBjb21wbGV0ZSBzdGF0ZV8zZCBoZWFkZXIuIE9ubHkgYSB2ZXJ5CmxpbWl0ZWQgc3Vic2V0
IG9mIHRob3NlIHN0YXRlcyBhcmUgdXNlZCBpbiB0aGUga2VybmVsIGFuZCB0aGUgcmVzdCBvZgp0
aGlzIG1hc3NpdmUgc3RhdGUgc2V0IGlzIHB1cmUgbm9pc2UgZnJvbSBhIGtlcm5lbCBQb1YuCgpS
ZWdhcmRzLApMdWNhcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
