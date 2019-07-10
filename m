Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D25A264A0F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 17:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309F86E10E;
	Wed, 10 Jul 2019 15:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74EBD6E108;
 Wed, 10 Jul 2019 15:49:26 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 02FEB80444;
 Wed, 10 Jul 2019 17:49:17 +0200 (CEST)
Date: Wed, 10 Jul 2019 17:49:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Derek Basehore <dbasehore@chromium.org>
Subject: Re: [PATCH v7 0/4] Panel rotation patches
Message-ID: <20190710154916.GA13810@ravnborg.org>
References: <20190710021659.177950-1-dbasehore@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190710021659.177950-1-dbasehore@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=CF2rFHbX0Lz1B-FzuQEA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-mediatek@lists.infradead.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGVyZWsuCgpPbiBUdWUsIEp1bCAwOSwgMjAxOSBhdCAwNzoxNjo1NVBNIC0wNzAwLCBEZXJl
ayBCYXNlaG9yZSB3cm90ZToKPiBUaGlzIGFkZHMgdGhlIHBsdW1iaW5nIGZvciByZWFkaW5nIHBh
bmVsIHJvdGF0aW9uIGZyb20gdGhlIGRldmljZXRyZWUKPiBhbmQgc2V0cyB1cCBhZGRpbmcgYSBw
YW5lbCBwcm9wZXJ0eSBmb3IgdGhlIHBhbmVsIG9yaWVudGF0aW9uIG9uCj4gTWVkaWF0ZWsgU29D
cyB3aGVuIGEgcm90YXRpb24gaXMgcHJlc2VudC4KPiAKPiB2NyBjaGFuZ2VzOgo+IC1mb3Jnb3Qg
dG8gYWRkIHN0YXRpYyBpbmxpbmUKPiAKPiB2NiBjaGFuZ2VzOgo+IC1hZGRlZCBlbnVtIGRlY2xh
cmF0aW9uIHRvIGRybV9wYW5lbC5oIGhlYWRlcgo+IAo+IHY1IGNoYW5nZXM6Cj4gLXJlYmFzZWQK
PiAKPiB2NCBjaGFuZ2VzOgo+IC1maXhlZCBzb21lIGNoYW5nZXMgbWFkZSB0byB0aGUgaTkxNSBk
cml2ZXIKPiAtY2xhcmlmaWVkIGNvbW1lbnRzIG9uIG9mIG9yaWVudGF0aW9uIGhlbHBlcgo+IAo+
IHYzIGNoYW5nZXM6Cj4gLWNoYW5nZWQgZnJvbSBhdHRhY2gvZGV0YWNoIGNhbGxiYWNrcyB0byBk
aXJlY3RseSBzZXR0aW5nIGZpeGVkIHBhbmVsCj4gIHZhbHVlcyBpbiBkcm1fcGFuZWxfYXR0YWNo
Cj4gLXJlbW92ZWQgdXBkYXRlIHRvIERvY3VtZW50YXRpb24KPiAtYWRkZWQgc2VwYXJhdGUgZnVu
Y3Rpb24gZm9yIHF1aXJrZWQgcGFuZWwgb3JpZW50YXRpb24gcHJvcGVydHkgaW5pdAo+IAo+IHYy
IGNoYW5nZXM6Cj4gZml4ZWQgYnVpbGQgZXJyb3JzIGluIGk5MTUKPiAKPiBEZXJlayBCYXNlaG9y
ZSAoNCk6Cj4gICBkcm0vcGFuZWw6IEFkZCBoZWxwZXIgZm9yIHJlYWRpbmcgRFQgcm90YXRpb24K
PiAgIGRybS9wYW5lbDogc2V0IGRpc3BsYXkgaW5mbyBpbiBwYW5lbCBhdHRhY2gKPiAgIGRybS9j
b25uZWN0b3I6IFNwbGl0IG91dCBvcmllbnRhdGlvbiBxdWlyayBkZXRlY3Rpb24KPiAgIGRybS9t
dGs6IGFkZCBwYW5lbCBvcmllbnRhdGlvbiBwcm9wZXJ0eQoKRmlyc3QgdHdvIHBhdGNoZXMgYXJl
OgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKTGFzdCB0d28g
cGF0Y2hlcyBhcmU6CkFja2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CgoJ
U2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
