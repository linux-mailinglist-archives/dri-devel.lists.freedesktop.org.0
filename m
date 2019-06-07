Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD16A398CB
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 00:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D508918D;
	Fri,  7 Jun 2019 22:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E738918D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 22:33:19 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFBBC334;
 Sat,  8 Jun 2019 00:33:16 +0200 (CEST)
Subject: Re: [PATCH v3 04/10] dt-bindings: display: renesas: lvds: Add
 renesas,companion property
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-5-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 sbsRB8KNNvVXBOVNwko86rQqF9drZuw=
Organization: Ideas on Board
Message-ID: <8a5bb883-f135-101c-5c59-52d10e8b52bc@ideasonboard.com>
Date: Fri, 7 Jun 2019 23:33:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190528141234.15425-5-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-GB
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559946797;
 bh=zZaOVkazACakBjto1ZCP7O2AnuIlKXTpF6TQtEVtNHE=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=tRkT6aN+YMTvvWpVE85kIO8dNI56qeIHD/VsMJ/aIQ/5ViJ+HC6TUVOkzNV0oB8f0
 IF4/Aza0kr8etlbFCWBl0kHpSzgCLC3FLJT9li58uXA4Eq0nPQpxbRYlHcDcRLkjNT
 ZGJPKTjZHi7n0P3WX4BOS+DPD7eDi8FRom+Z+qEQ=
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
Reply-To: kieran.bingham@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCk9uIDI4LzA1LzIwMTkgMTU6MTIsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6
Cj4gQWRkIGEgbmV3IG9wdGlvbmFsIHJlbmVzYXMsY29tcGFuaW9uIHByb3BlcnR5IHRvIHBvaW50
IHRvIHRoZSBjb21wYW5pb24KPiBMVkRTIGVuY29kZXIuIFRoaXMgaXMgdXNlZCB0byBzdXBwb3J0
IGR1YWwtbGluayBvcGVyYXRpb24gd2hlcmUgdGhlIG1haW4KPiBMVkRTIGVuY29kZXIgc3BsaXRz
IGV2ZW4tbnVtYmVyZWQgYW5kIG9kZC1udW1iZXJlZCBwaXhlbHMgYmV0d2VlbiB0aGUKPiB0d28g
TFZEUyBlbmNvZGVycy4KPiAKPiBUaGUgbmV3IHByb3BlcnR5IGRvZXNuJ3QgY29udHJvbCB0aGUg
bW9kZSBvZiBvcGVyYXRpb24sIGl0IG9ubHkKPiBkZXNjcmliZXMgdGhlIHJlbGF0aW9uc2hpcCBi
ZXR3ZWVuIHRoZSBtYXN0ZXIgYW5kIGNvbXBhbmlvbiBMVkRTCj4gZW5jb2RlcnMuCj4gCj4gU2ln
bmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlk
ZWFzb25ib2FyZC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEphY29wbyBNb25kaSA8amFjb3BvQGptb25k
aS5vcmc+Cj4gVGVzdGVkLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5v
cmc+Cj4gLS0tCj4gQ2hhbmdlcyBzaW5jZSB2MjoKPiAKPiAtIENsYXJpZnkgd2hlbiB0aGUgY29t
cGFuaW9uIHByb3BlcnR5IGlzIHJlcXVpcmVkIG9yIG5vdCBhbGxvd2VkCj4gCj4gQ2hhbmdlcyBz
aW5jZSB2MToKPiAKPiAtIEZpeGVkIHR5cG8KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4dCAgICB8IDcgKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMs
bHZkcy50eHQKPiBpbmRleCA5MDBhODg0YWQ5ZjUuLjJkMjRiZDhjYmVjNSAxMDA2NDQKPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNh
cyxsdmRzLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0Cj4gQEAgLTQ1LDYgKzQ1LDEzIEBAIE9GIGdyYXBo
IGJpbmRpbmdzIHNwZWNpZmllZCBpbiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Z3JhcGgudHh0Lgo+ICAKPiAgRWFjaCBwb3J0IHNoYWxsIGhhdmUgYSBzaW5nbGUgZW5kcG9pbnQu
Cj4gIAo+ICtPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ICs+ICstIHJlbmVzYXMsY29tcGFuaW9uIDog
cGhhbmRsZSB0byB0aGUgY29tcGFuaW9uIExWRFMgZW5jb2Rlci4gVGhpcwpwcm9wZXJ0eSBpcwo+
ICsgIG1hbmRhdG9yeSBmb3IgdGhlIGZpcnN0IExWRFMgZW5jb2RlciBvbiBEMyBhbmQgRTMgU29D
cywgYW5kIHNoYWxsIHBvaW50IHRvCj4gKyAgdGhlIHNlY29uZCBlbmNvZGVyIHRvIGJlIHVzZWQg
YXMgYSBjb21wYW5pb24gaW4gZHVhbC1saW5rIG1vZGUuIEl0IHNoYWxsIG5vdAo+ICsgIGJlIHNl
dCBmb3IgYW55IG90aGVyIExWRFMgZW5jb2Rlci4KPiArCgpJIHNlZSBTYW0gaGFzIGFscmVhZHkg
YXNrZWQgZm9yIGFuIHVwZGF0ZWQgZXhhbXBsZSwgc28gd2l0aCB0aGF0OgoKSSdtIGZpbmUgd2l0
aCB0aGUgdGV4dCBhYm92ZS4KClJldmlld2VkLWJ5OiBLaWVyYW4gQmluZ2hhbSA8a2llcmFuLmJp
bmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgoKPiAgCj4gIEV4YW1wbGU6Cj4gIAo+IAoK
LS0gClJlZ2FyZHMKLS0KS2llcmFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
