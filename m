Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FACD07FC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1716E8FE;
	Wed,  9 Oct 2019 07:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud8.xs4all.net (lb3-smtp-cloud8.xs4all.net
 [194.109.24.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3651D6E216
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 07:56:36 +0000 (UTC)
Received: from [IPv6:2001:983:e9a7:1:a406:d42:889e:ff00]
 ([IPv6:2001:983:e9a7:1:a406:d42:889e:ff00])
 by smtp-cloud8.xs4all.net with ESMTPA
 id HkMBiUPk8op0AHkMCiKhZ0; Tue, 08 Oct 2019 09:56:34 +0200
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20191008103045.2d4711e2@canb.auug.org.au>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <225b19dd-a0bb-37a0-afbd-14acd5067521@xs4all.nl>
Date: Tue, 8 Oct 2019 09:56:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191008103045.2d4711e2@canb.auug.org.au>
Content-Language: en-US
X-CMAE-Envelope: MS4wfNHyCzjZ5wPea/gAo1szz4vcI4XTrIQTlvprro1WK/gbn2HoolZbxpzQpvlFraBU2vkc7+nASMtkUdwCbT7DAIgJeju6qmqsvdJOR6Rreu9wHkHHzfgv
 Ya8JLTzXp+JldA4phq6VLCGKCverlqvgHwLNSpOlUS4zRgmCQmFgPfpIrUQKb8PNhLGznZjL3rd6LjyAAdgQ/aAS30o13V1WfBF5A1tmmSJRANRrjSyhMRPK
 w46UIZ5aqONCtdaZW13yu86Gut4PdizoYl5HOOCugY9Gmr9a8E71R7c+9we8ukMSh/DAAO3we+sMBH1mfd6x2IIVaOf+r6kHaH2YoRBX8IEKwFPsW6vpxFpd
 LpKTsBseU97LaiZk0PwIAY16x8w41nBzOLOjetu6vF6Ml/K69GNtTRm+nVufE9DgmNYPBoWJ1oQk9I+DW7LZ6SdLmyOIL1co9aRgw01zi5ck1KvEvzVTLQaG
 rxQYPAGHP5yLSD5vXEhWVgX3JAc+TA37z8sCzQ==
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:51 +0000
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvOC8xOSAxOjMwIEFNLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3RlOgo+IEhpIGFsbCwKPiAK
PiBBZnRlciBtZXJnaW5nIHRoZSBkcm0tbWlzYyB0cmVlLCB0b2RheSdzIGxpbnV4LW5leHQgYnVp
bGQgKHg4Nl82NAo+IGFsbG1vZGNvbmZpZykgZmFpbGVkIGxpa2UgdGhpczoKPiAKPiAKPiBDYXVz
ZWQgYnkgY29tbWl0Cj4gCj4gICAxMGQ4ZjMwOGJhM2UgKCJjZWM6IGFkZCBjZWNfYWRhcHRlciB0
byBjZWNfbm90aWZpZXJfY2VjX2FkYXBfdW5yZWdpc3RlcigpIikKPiAKPiBpbnRlcmFjdGluZyB3
aXRoIGNvbW1pdAo+IAo+ICAgN2U4NmVmYTJmZjAzICgibWVkaWE6IGNlYy1ncGlvOiBhZGQgbm90
aWZpZXIgc3VwcG9ydCIpCj4gCj4gZm9ybSB0aGUgdjRsLWR2YiB0cmVlLgo+IAo+IEkgaGF2ZSBh
cHBsaWVkIHRoZSBmb2xsb3dpbmcgbWVyZ2UgZml4IHBhdGNoLgoKVGhhdCdzIHRoZSBjb3JyZWN0
IGZpeCwgdGhhbmsgeW91IQoKUmVnYXJkcywKCglIYW5zCgo+IAo+IEZyb206IFN0ZXBoZW4gUm90
aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pgo+IERhdGU6IFR1ZSwgOCBPY3QgMjAxOSAxMDoy
NjowNSArMTEwMAo+IFN1YmplY3Q6IFtQQVRDSF0gY2VjOiBmaXggdXAgZm9yICJjZWM6IGFkZCBj
ZWNfYWRhcHRlciB0bwo+ICBjZWNfbm90aWZpZXJfY2VjX2FkYXBfdW5yZWdpc3RlcigpIgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pgo+
IC0tLQo+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NlYy1ncGlvL2NlYy1ncGlvLmMgfCA0ICsr
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jZWMtZ3Bpby9jZWMtZ3Bpby5j
IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jZWMtZ3Bpby9jZWMtZ3Bpby5jCj4gaW5kZXggN2Jl
OTFlNzEyYzRhLi40MmQyYzJjZDlhNzggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9jZWMtZ3Bpby9jZWMtZ3Bpby5jCj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9j
ZWMtZ3Bpby9jZWMtZ3Bpby5jCj4gQEAgLTI1OSw3ICsyNTksNyBAQCBzdGF0aWMgaW50IGNlY19n
cGlvX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlyZXR1cm4gMDsKPiAg
Cj4gIHVucmVnX25vdGlmaWVyOgo+IC0JY2VjX25vdGlmaWVyX2NlY19hZGFwX3VucmVnaXN0ZXIo
Y2VjLT5ub3RpZmllcik7Cj4gKwljZWNfbm90aWZpZXJfY2VjX2FkYXBfdW5yZWdpc3RlcihjZWMt
Pm5vdGlmaWVyLCBjZWMtPmFkYXApOwo+ICBkZWxfYWRhcDoKPiAgCWNlY19kZWxldGVfYWRhcHRl
cihjZWMtPmFkYXApOwo+ICAJcmV0dXJuIHJldDsKPiBAQCAtMjY5LDcgKzI2OSw3IEBAIHN0YXRp
YyBpbnQgY2VjX2dwaW9fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsK
PiAgCXN0cnVjdCBjZWNfZ3BpbyAqY2VjID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7Cj4g
IAo+IC0JY2VjX25vdGlmaWVyX2NlY19hZGFwX3VucmVnaXN0ZXIoY2VjLT5ub3RpZmllcik7Cj4g
KwljZWNfbm90aWZpZXJfY2VjX2FkYXBfdW5yZWdpc3RlcihjZWMtPm5vdGlmaWVyLCBjZWMtPmFk
YXApOwo+ICAJY2VjX3VucmVnaXN0ZXJfYWRhcHRlcihjZWMtPmFkYXApOwo+ICAJcmV0dXJuIDA7
Cj4gIH0KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
