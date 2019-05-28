Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5B12CCCC
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 18:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD816E26D;
	Tue, 28 May 2019 16:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A426E26D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 16:59:04 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3AFF920045;
 Tue, 28 May 2019 18:59:02 +0200 (CEST)
Date: Tue, 28 May 2019 18:59:00 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 04/10] dt-bindings: display: renesas: lvds: Add
 renesas, companion property
Message-ID: <20190528165900.GA10262@ravnborg.org>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-5-laurent.pinchart+renesas@ideasonboard.com>
 <20190528163730.GA9610@ravnborg.org>
 <20190528164916.GA17874@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528164916.GA17874@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=RqNDS8CZelupaJZLNH0A:9 a=CjuIK1q_8ugA:10
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudC4KCj4gPiA+ICAKPiA+ID4gK09wdGlvbmFsIHByb3BlcnRpZXM6Cj4gPiA+ICsK
PiA+ID4gKy0gcmVuZXNhcyxjb21wYW5pb24gOiBwaGFuZGxlIHRvIHRoZSBjb21wYW5pb24gTFZE
UyBlbmNvZGVyLiBUaGlzIHByb3BlcnR5IGlzCj4gPiA+ICsgIG1hbmRhdG9yeSBmb3IgdGhlIGZp
cnN0IExWRFMgZW5jb2RlciBvbiBEMyBhbmQgRTMgU29DcywgYW5kIHNoYWxsIHBvaW50IHRvCj4g
PiA+ICsgIHRoZSBzZWNvbmQgZW5jb2RlciB0byBiZSB1c2VkIGFzIGEgY29tcGFuaW9uIGluIGR1
YWwtbGluayBtb2RlLiBJdCBzaGFsbCBub3QKPiA+ID4gKyAgYmUgc2V0IGZvciBhbnkgb3RoZXIg
TFZEUyBlbmNvZGVyLgo+ID4gCj4gPiBJZiB0aGUgRDMgYW5kIEUzIHNvY3MgZG8gbm90IG1hbmRh
dGUgdGhlIHVzZSBvZiBkdWFsLWxpbmssIHRoZW4gd2hhdCB0bwo+ID4gZG8gaW4gdGhlIERUPyBC
ZWNhdXNlIGFjY29yZGluZyB0byB0aGUgYWJvdmUgdGhpcyBwcm9wZXJ0eSBtdXN0IGJlCj4gPiBz
cGVjaWZpZWQgZm9yIEQzIGFuZCBFMyBTT0Mncy4KPiAKPiBUaGlzIHByb3BlcnR5IGRvZXNuJ3Qg
ZW5hYmxlIGR1YWwtbGluayBtb2RlLCBpdCBvbmx5IHNwZWNpZmllcyB0aGUKPiBjb21wYW5pb24g
TFZEUyBlbmNvZGVyIHVzZWQgZm9yIGR1YWwtbGluayBtb2RlLCB3aGVuIGVuYWJsZWQgKHRocm91
Z2gKPiBjb21tdW5pY2F0aW9uIGJldHdlZW4gdGhlIExWRFMgZW5jb2RlciBhbmQgdGhlIExWRFMg
cmVjZWl2ZXIgYXQKPiBydW50aW1lKS4KPiAKPiBKYWNvcG8gaGFkIGEgc2ltaWxhciBjb21tZW50
IHNvIEkgc3VwcG9zZSB0aGlzIGlzbid0IGNsZWFyLiBIb3cgd291bGQKPiB5b3Ugd29yZCBpdCB0
byBtYWtlIGl0IGNsZWFyID8KTGV0IG1lIHRyeToKCgotIHJlbmVzYXMsY29tcGFuaW9uIDogcGhh
bmRsZSB0byB0aGUgY29tcGFuaW9uIExWRFMgZW5jb2Rlci4gVGhpcyBwcm9wZXJ0eSBpcwogIG1h
bmRhdG9yeSBmb3IgdGhlIGZpcnN0IExWRFMgZW5jb2RlciBvbiBEMyBhbmQgRTMgU29DcyB3aGVu
IGR1YWwtbGluayBtb2RlCiAgaXMgc3VwcG9ydGVkLgogIFRoZSBwcm9wZXJ0eSBzaGFsbCBwb250
IHRvIHRoZSBwaGFuZGxlIG9mIHRoZSBzZWNvbmQgZW5jb2RlciB0byBiZSB1c2VkIGFzIGEKICBj
b21wYW5pb24gaW4gZHVhbC1saW5rIG1vZGUuIEl0IHNoYWxsIG5vdCBiZSBzZXQgZm9yIGFueSBv
dGhlciBMVkRTIGVuY29kZXIuCgpUaGUgbWFpbiBkaWZmZXJlbmNlIGlzICJ3aGVuIGR1YWwtbGlu
ayBtb2RlIGlzIHN1cHBvcnRlZCIuCkFzIHBlciBteSB1bmRlcnN0YW5kaW5nIHRoaXMgcHJvcGVy
dHkgaXMgb25seSByZWxldmFudCB3aGVuIHRoZSBhY3R1YWwKSFcgc3VwcG9ydHMgLyB1c2VzIGR1
YWwtbGluayBtb2RlLgpTbyBmb3IgYSBib2FyZCB0aGF0IGRvIG5vdCBldmVuIHdpcmUgdXAgZHVh
bC1saW5rLCB0aGVuIHNldHRpbmcgdGhlCnByb3BlcnR5IHdvdWxkIGJlIGNvbmZ1c2luZy4KCkkg
aG9wZSB0aGlzIGJldHRlciBkZXNjcmliZXMgbXkgdW5kZXJzdGFuZGluZy4KCglTYW0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
