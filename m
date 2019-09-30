Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D46C243B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 17:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97836E478;
	Mon, 30 Sep 2019 15:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F9A6E478
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 15:26:01 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 65BFC806B8;
 Mon, 30 Sep 2019 17:25:58 +0200 (CEST)
Date: Mon, 30 Sep 2019 17:25:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH] drm/tilcdc: include linux/pinctrl/consumer.h again
Message-ID: <20190930152556.GA4622@ravnborg.org>
References: <02b03f74cf941f52a941a36bdc8dabb4a69fd87e.1569852588.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02b03f74cf941f52a941a36bdc8dabb4a69fd87e.1569852588.git.jsarha@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
 a=sozttTNsAAAA:8 a=7gkXJVJtAAAA:8 a=URMKmws2qAKxBXesIdYA:9
 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22 a=aeg5Gbbo78KNqacMgKqU:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: arnd@arndb.de, laurent.pinchart@ideasonboard.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMDU6MTU6NTNQTSArMDMwMCwgSnlyaSBTYXJoYSB3cm90
ZToKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IFRoaXMgd2FzIGFw
cGFyZW50bHkgZHJvcHBlZCBieSBhY2NpZGVudCBpbiBhIHJlY2VudAo+IGNsZWFudXAsIGNhdXNp
bmcgYSBidWlsZCBmYWlsdXJlIGluIHNvbWUgY29uZmlndXJhdGlvbnMgbm93Ogo+IAo+IGRyaXZl
cnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3RmcDQxMC5jOjI5NjoxMjogZXJyb3I6IGltcGxpY2l0
IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdkZXZtX3BpbmN0cmxfZ2V0X3NlbGVjdF9kZWZhdWx0
JyBbLVdlcnJvciwtV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+IAo+IEZpeGVzOiBm
Y2I1NzY2NDE3MmUgKCJkcm0vdGlsY2RjOiBkcm9wIHVzZSBvZiBkcm1QLmgiKQo+IFNpZ25lZC1v
ZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gUmV2aWV3ZWQtYnk6IExhdXJl
bnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBKeXJpIFNhcmhhIDxqc2FyaGFAdGkuY29tPgoKVGhhbmtzCkFja2VkLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cgo+IC0tLQo+IEp1c3QgcmVvcmRlcmVkIHRoZSBp
bmNsdWRlcyBpbiBhcGxoYXBldGljYWwgb3JkZXIgYW5kIGFwcGxpZWQKPiBMYXVyZW50J3MgUmV2
aWV3ZWQtYnkuIEknbGwgYXBwbHkgdGhpcyB0byBkcm0tbWlzYy1uZXh0Lgo+IAo+ICBkcml2ZXJz
L2dwdS9kcm0vdGlsY2RjL3RpbGNkY190ZnA0MTAuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90
aWxjZGNfdGZwNDEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY190ZnA0MTAuYwo+
IGluZGV4IDUyNWRjMWMwZjFjMS4uNTMwZWRiM2I1MWNjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90aWxjZGMvdGlsY2RjX3RmcDQxMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rp
bGNkYy90aWxjZGNfdGZwNDEwLmMKPiBAQCAtNyw2ICs3LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4
L2dwaW8uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21vZF9kZXZpY2V0YWJsZS5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvb2ZfZ3Bpby5oPgo+ICsjaW5jbHVkZSA8bGludXgvcGluY3RybC9jb25zdW1lci5o
Pgo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gIAo+ICAjaW5jbHVkZSA8
ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+Cj4gLS0gCj4gVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFu
ZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuIFktdHVubnVzL0J1c2luZXNz
IElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
