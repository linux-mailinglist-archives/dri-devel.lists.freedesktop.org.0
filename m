Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A339529D1B0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 20:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DFA6E311;
	Wed, 28 Oct 2020 19:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62F36E311
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 19:25:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67912AEC4;
 Wed, 28 Oct 2020 19:25:56 +0000 (UTC)
Subject: Re: [PATCH 1/5] fbdev/atafb: Remove unused extern variables
To: Peilin Ye <yepeilin.cs@gmail.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <cover.1603788511.git.yepeilin.cs@gmail.com>
 <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <4c15a505-9704-9639-aeaa-e865d264c120@suse.de>
Date: Wed, 28 Oct 2020 20:25:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAyNy4xMC4yMCB1bSAxNzozMSBzY2hyaWViIFBlaWxpbiBZZToKPiBSZW1vdmUgNiB1bnVz
ZWQgZXh0ZXJuIHZhcmlhYmxlcyB0byByZWR1Y2UgY29uZnVzaW9uLiBJdCBpcyB3b3J0aAo+IG1l
bnRpb25pbmcgdGhhdCBsaWIvZm9udHMvZm9udF84eDguYyBhbmQgbGliL2ZvbnRzL2ZvbnRfOHgx
Ni5jIGFsc28KPiBkZWNsYXJlIGBmb250ZGF0YV84eDhgIGFuZCBgZm9udGRhdGFfOHgxNmAgcmVz
cGVjdGl2ZWx5LCBhbmQgdGhpcyBmaWxlCj4gaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGVtLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFBlaWxpbiBZZSA8eWVwZWlsaW4uY3NAZ21haWwuY29tPgoKQWNr
ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgoKPiAtLS0KPiAk
ICMgQnVpbGQtdGVzdGVkIChVYnVudHUgMjAuMDQpCj4gJCBzdWRvIGFwdCBpbnN0YWxsIGdjYy1t
NjhrLWxpbnV4LWdudQo+ICQgY3AgYXJjaC9tNjhrL2NvbmZpZ3MvYXRhcmlfZGVmY29uZmlnIC5j
b25maWcKPiAkIG1ha2UgQVJDSD1tNjhrIG1lbnVjb25maWcKPiAkIG1ha2UgQVJDSD1tNjhrIENS
T1NTX0NPTVBJTEU9bTY4ay1saW51eC1nbnUtIC1qYG5wcm9jYCBhbGwKPiAKPiAgZHJpdmVycy92
aWRlby9mYmRldi9hdGFmYi5jIHwgOCAtLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9hdGFmYi5jIGIv
ZHJpdmVycy92aWRlby9mYmRldi9hdGFmYi5jCj4gaW5kZXggZjI1M2RhYTA1ZDlkLi5lMzgxMmE4
ZmY1NWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9hdGFmYi5jCj4gKysrIGIv
ZHJpdmVycy92aWRlby9mYmRldi9hdGFmYi5jCj4gQEAgLTI0MCwxNCArMjQwLDYgQEAgc3RhdGlj
IGludCAqTVYzMDBfcmVnID0gTVYzMDBfcmVnXzhiaXQ7Cj4gIAo+ICBzdGF0aWMgaW50IGludmVy
c2U7Cj4gIAo+IC1leHRlcm4gaW50IGZvbnRoZWlnaHRfOHg4Owo+IC1leHRlcm4gaW50IGZvbnR3
aWR0aF84eDg7Cj4gLWV4dGVybiB1bnNpZ25lZCBjaGFyIGZvbnRkYXRhXzh4OFtdOwo+IC0KPiAt
ZXh0ZXJuIGludCBmb250aGVpZ2h0Xzh4MTY7Cj4gLWV4dGVybiBpbnQgZm9udHdpZHRoXzh4MTY7
Cj4gLWV4dGVybiB1bnNpZ25lZCBjaGFyIGZvbnRkYXRhXzh4MTZbXTsKPiAtCj4gIC8qCj4gICAq
IHN0cnVjdCBmYl9vcHMgewo+ICAgKgkqIG9wZW4vcmVsZWFzZSBhbmQgdXNhZ2UgbWFya2luZwo+
IAoKLS0gClRob21hcyBaaW1tZXJtYW5uCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpCkdlc2Now6RmdHNmw7xocmVy
OiBGZWxpeCBJbWVuZMO2cmZmZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
