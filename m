Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D4E2D9884
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 14:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CEF89C3B;
	Mon, 14 Dec 2020 13:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FEC89C3B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 13:06:45 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1konYo-0000YR-Fa; Mon, 14 Dec 2020 14:06:42 +0100
Message-ID: <e66672b54d8940995b79bd07ac35d7f4f83b66ea.camel@pengutronix.de>
Subject: Re: Using Etnaviv with mxsfb-drm
From: Lucas Stach <l.stach@pengutronix.de>
To: Frieder Schrempf <frieder.schrempf@kontron.de>, "marex@denx.de"
 <marex@denx.de>
Date: Mon, 14 Dec 2020 14:06:41 +0100
In-Reply-To: <339ba605-f0af-32d7-9678-877fd6b1fc58@kontron.de>
References: <339ba605-f0af-32d7-9678-877fd6b1fc58@kontron.de>
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRnJpZWRlciwKCkFtIE1vbnRhZywgZGVuIDE0LjEyLjIwMjAsIDEzOjMzICswMTAwIHNjaHJp
ZWIgRnJpZWRlciBTY2hyZW1wZjoKPiBIaSBMdWNhcywgaGkgTWFyZWssCj4gCj4gd2hpbGUgZG9p
bmcgc29tZSB0ZXN0cyBvbiBpLk1YOE1NIHdpdGggRXRuYXZpdiBhbmQgbXhzZmItZHJtICh1c2lu
ZyB0aGUgCj4gcGF0Y2hlcyBmb3IgRFNJTSwgR1BDLCBCTEstQ1RMLCBldGMuLCBzZWUgYnJhbmNo
IGF0IFsxXSksIEkgbm90aWNlZCB0aGF0IAo+IEkgZG9uJ3Qgc2VlbSB0byBiZSBhYmxlIHRvIHJ1
biBnbG1hcmsyOgo+IAo+IH4jIGdsbWFyazItZXMyLWRybQo+ID09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiDCoMKgwqDCoMKgZ2xtYXJrMiAy
MDE3LjA3Cj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQo+IMKgwqDCoMKgwqBPcGVuR0wgSW5mb3JtYXRpb24KPiDCoMKgwqDCoMKgR0xfVkVO
RE9SOiAgICAgZXRuYXZpdgo+IMKgwqDCoMKgwqBHTF9SRU5ERVJFUjogICBWaXZhbnRlIEdDNjAw
IHJldiA0NjUzCj4gwqDCoMKgwqDCoEdMX1ZFUlNJT046ICAgIE9wZW5HTCBFUyAyLjAgTWVzYSAy
MC4yLjQKPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09Cj4gW2J1aWxkXSB1c2UtdmJvPWZhbHNlOkVycm9yOiBGYWlsZWQgdG8gY3JlYXRlIEZC
OiAtMjIKPiBTZWdtZW50YXRpb24gZmF1bHQKPiAKPiBSdW5uaW5nIGEgUXQgYXBwbGljYXRpb24g
d2l0aCB0aGUgZWdsZnNfa21zIGJhY2tlbmQgcHJvZHVjZXMgYSBzaW1pbGFyIAo+IGVycm9yLCB3
aGlsZSBydW5uaW5nIGttc2N1YmUgb3IgYXBwbGljYXRpb25zIHdpdGhvdXQgR1BVIHJlbmRlcmlu
ZyB3b3JrcyAKPiBmaW5lLgo+IAo+IFdoYXQgYW0gSSBtaXNzaW5nPyBXaGVuIEkgdXNlZCBpbXgt
ZHJtLCBJIGRpZG4ndCBoYXZlIGFueSBzdWNoIGlzc3Vlcy4gCj4gSG93IGlzIG14c2ZiLWRybSBk
aWZmZXJlbnQ/CgpUaGlzIGNvdWxkIGhhdmUgbXVsdGlwbGUgcm90IGNhdXNlcy4gRmlyc3QsIHBs
ZWFzZSBtYWtlIHN1cmUgdGhhdCB5b3UKaGF2ZSBzdWZmaWNpZW50IENNQSBtZW1vcnkuIEFsc28g
dGhlIGVMQ0RJRiBoYXJkd2FyZSBoYXMgc29tZQp1bmZvcnR1bmF0ZSByZXN0cmljdGlvbnMgb24g
YnVmZmVyIHN0cmlkZSwgd2hpY2ggc3VyZmFjZWQgYSBidWcgaW4gdGhlCmV0bmF2aXYgYnVmZmVy
IGxheW91dCBjb2RlIGFsc28gb24gc29tZSB2ZXJ5IGNvbW1vbiBkaXNwbGF5CnJlc29sdXRpb25z
LiBQbGVhc2UgbWFrZSBzdXJlIHlvdSBoYXZlIFsxXSBhcHBsaWVkIHRvIGdldCByaWQgb2YgdGhp
cwpidWcuCgpSZWdhcmRzLApMdWNhcwoKWzFdIGh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcv
bWVzYS9tZXNhL2NvbW1pdC8/aWQ9Mzg2MmNlYzMxNGRlNGE4MjgyMWQ5Njk0YWUyZWVjNmY2Mjll
Yzc4MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
