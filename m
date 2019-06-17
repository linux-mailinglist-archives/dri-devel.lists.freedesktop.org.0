Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBC547BD3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 10:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BEF789147;
	Mon, 17 Jun 2019 08:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1D589147
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 08:06:54 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id y198so5811775lfa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 01:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UBAIYgr3qMK7KPe2vk2HnkrCN8Z499UT+fyGo5dytmg=;
 b=t5v8b84tXlO66AblkHGa14dcyLBYQlp+jH4wZaQprG6s/fG/Qs5uGIyC4UF3HYxOoz
 5bOR6SMOg14iHl1Ardds0tW8OfCd3gKj9qxOPtqPSUVhl7AO4aqFT7UQ9OEcLqWA7tyz
 eD05DFv0fXk4FoC2QrBtV+Ogu+xSbkQ78wn4yW1K/F0ASeuzYSjSJNscVgI5ZQo0DwIg
 XQAfWbib0bN8vSf2MBaTphpdBDOO0qgK6peReMqwLded8WZa4U28NaJKj786fHVydAu1
 mlB97eztdQfYoN1cLiOeNKgFdrREzC7rqkuBAMbJ3zEiK6X2akgSondD7m08uc6fRF0E
 TnzA==
X-Gm-Message-State: APjAAAVk+q4M26ZUSJ9F0VPQADL5XvVki54mv2JdoGlnjop3z9rrJM1c
 hiIHyOXWFk27Gu8OE3s+1UVEeDt3RCRNdFc/U2k=
X-Google-Smtp-Source: APXvYqxsNaI0j7ZDK/oBDGI+JMsaCwWe50htav7v93pfnpqy1paFPPZWjCEXJWv9iX6EQ2tFXHlJ785TORXA5arqirk=
X-Received: by 2002:ac2:546a:: with SMTP id e10mr7058679lfn.75.1560758812459; 
 Mon, 17 Jun 2019 01:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190614023225.GA27938@t-1000>
In-Reply-To: <20190614023225.GA27938@t-1000>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jun 2019 10:06:39 +0200
Message-ID: <CAMuHMdW0iHNuS2Q1n4jynVGrgcnOPrLWX08ffWdT3GUGaidt-g@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: Fix checkpatch ERROR: space prohibited
 before that close parenthesis ')'
To: Shobhit Kukreti <shobhitkukreti@gmail.com>
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
Cc: Andy Whitcroft <apw@canonical.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Joe Perches <joe@perches.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2hvYmhpdCwKClRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIEZyaSwgSnVuIDE0LCAyMDE5
IGF0IDQ6MzQgQU0gU2hvYmhpdCBLdWtyZXRpCjxzaG9iaGl0a3VrcmV0aUBnbWFpbC5jb20+IHdy
b3RlOgo+IENsZWFuZWQgdXAgY29kZSB0byByZXNvbHZlICB0aGUgY2hlY2twYXRjaCBlcnJvcgo+
IEVSUk9SOiBzcGFjZSBwcm9oaWJpdGVkIGJlZm9yZSB0aGF0IGNsb3NlIHBhcmVudGhlc2lzICcp
Jwo+IGZyb20gdGhlIGZpbGU6Cj4KPiBmYnRmdC9mYnRmdC1idXMuYwoKSU1ITyB0aGF0IGlzIGEg
Ym9ndXMgY2hlY2twYXRjaCBlcnJvci4uLgoKPiBTaWduZWQtb2ZmLWJ5OiBTaG9iaGl0IEt1a3Jl
dGkgPHNob2JoaXRrdWtyZXRpQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9zdGFnaW5nL2Zi
dGZ0L2ZidGZ0LWJ1cy5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2ZidGZ0
L2ZidGZ0LWJ1cy5jIGIvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LWJ1cy5jCj4gaW5kZXgg
MmVhODE0ZC4uMmI0M2JjMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0
ZnQtYnVzLmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtYnVzLmMKPiBAQCAt
NjIsOSArNjIsOSBAQCBvdXQ6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICB9ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gIEVYUE9SVF9TWU1CT0woZnVuYyk7Cj4KPiAtZGVmaW5lX2ZidGZ0X3dyaXRlX3JlZyhm
YnRmdF93cml0ZV9yZWc4X2J1czgsIHU4LCB1OCwgKQo+ICtkZWZpbmVfZmJ0ZnRfd3JpdGVfcmVn
KGZidGZ0X3dyaXRlX3JlZzhfYnVzOCwgdTgsIHU4LCkKPiAgZGVmaW5lX2ZidGZ0X3dyaXRlX3Jl
ZyhmYnRmdF93cml0ZV9yZWcxNl9idXM4LCBfX2JlMTYsIHUxNiwgY3B1X3RvX2JlMTYpCj4gLWRl
ZmluZV9mYnRmdF93cml0ZV9yZWcoZmJ0ZnRfd3JpdGVfcmVnMTZfYnVzMTYsIHUxNiwgdTE2LCAp
Cj4gK2RlZmluZV9mYnRmdF93cml0ZV9yZWcoZmJ0ZnRfd3JpdGVfcmVnMTZfYnVzMTYsIHUxNiwg
dTE2LCkKCi4uLiBhcyB0aGUgc3BhY2UgaXMgdGhlIChtYW5kYXRvcnkpIHNlcGFyYXRvciBiZXR3
ZWVuIHRoZSBjb21tYSBhbmQgdGhlCihlbXB0eSkgbGFzdCBwYXJhbWV0ZXIgdmFsdWUuCgpDaGVj
a3BhdGNoIGhhcyBzb21lIGxpbWl0YXRpb25zIHdoZW4gcGFyc2luZyB0aGUgQyBwcmVwcm9jZXNz
b3IgbWFjcm8KbGFuZ3VhZ2FnZS4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAg
ICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9m
IExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBj
b252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tl
ci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3Jh
bW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
