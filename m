Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E108BD0F20
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 14:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D08A6E99C;
	Wed,  9 Oct 2019 12:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D836E99C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 12:48:26 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:51119
 helo=[192.168.10.177])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iIBOC-0003Og-Ok; Wed, 09 Oct 2019 14:48:24 +0200
Subject: Re: [1/3] drm/tinydrm/Kconfig: Remove menuconfig DRM_TINYDRM
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190725105132.22545-2-noralf@tronnes.org>
 <20191001123636.GA8351@ziepe.ca>
 <1fffe7b1-a738-a9e3-ea5f-9d696cb98650@tronnes.org>
 <20191001134555.GB22532@ziepe.ca>
 <75055e2d-44f7-0cba-4e41-537097b73c3c@tronnes.org>
 <20191009104531.GW16989@phenom.ffwll.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <1bc77839-c47a-6e79-dd6e-e26e05b34eae@tronnes.org>
Date: Wed, 9 Oct 2019 14:48:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009104531.GW16989@phenom.ffwll.local>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:Cc:From:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SYIJ6IPWOlpj5WATHXmZNe6pBHCn+BfMqMdU9hKzdt8=; b=L69K3sSVmY1LeI7Fga3acpiRNq
 1qvgIiW40RId5WHUHO+isXNclHGgeUPyvczPdnNDNOl+2KOtMVkgaWC1aNuxCL0F24uDXDpThLzbb
 qywKftzwBjivTZkR2OpGXnRqKlm4803pQMuy2CP8+96KIo8vtD0eHRl0PGuZZUdeX+QAE6H0QIptP
 G51GadLMl2V5hpPN+ZlbjXdJo2gFuI36y2fq6V1jQbcETkod3GQw2ATIdQtlrOg6zBm+Fqz8O8TC1
 mBpmguOxGCZPRs9lotdzAD2mo6syj2HwI3ZSpGMzyYFOsURO8UoUPHM+yFWivSZydKt+aDLXqlUXv
 khH7fLxg==;
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
Cc: hdegoede@redhat.com, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDkuMTAuMjAxOSAxMi40NSwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBPbiBUdWUsIE9j
dCAwMSwgMjAxOSBhdCAwNDowNzozOFBNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4+
IEhpIGRybS1taXNjIG1haW50YWluZXJzLAo+Pgo+PiBJIGhhdmUganVzdCBhcHBsaWVkIGEgcGF0
Y2ggdG8gZHJtLW1pc2MtbmV4dCB0aGF0IGFzIGl0IHR1cm5zIG91dCBzaG91bGQKPj4gaGF2ZSBi
ZWVuIGFwcGxpZWQgdG8gLWZpeGVzIGZvciB0aGlzIC1yYyBjeWNsZS4KPj4KPj4gU2hvdWxkIEkg
Y2hlcnJ5IHBpY2sgaXQgdG8gZHJtLW1pc2MtbmV4dC1maXhlcz8KPiAKPiBZdXAsIGNoZXJyeSBw
aWNrIGFuZCByZWZlcmVuY2UgdGhlIGNvbW1pdCB0aGF0J3MgYWxyZWFkeSBpbiAtbmV4dCAoaW4g
Y2FzZQo+IGl0IGNyZWF0ZXMgY29uZmxpY3RzIGRvd24gdGhlIHJvYWQgdGhhdCByZWZlcmVuY2Ug
bWFrZXMgdGhlIG1lc3MgZWFzaWVyIHRvCj4gdW5kZXJzdGFuZCkuCj4gCgpJIHJlbWVtYmVyZWQg
dGhhdCBNYXhpbWUganVzdCBzZW50IG91dCBhIGZpeGVzIHB1bGwgYW5kIHRoZSBzdWJqZWN0IHNh
eXMKZHJtLW1pc2MtZml4ZXMuIFRoZSBwcmV2b3VzIG9uZSBoZSBzZW50IG91dCB3YXMgLW5leHQt
Zml4ZXMuClNvIGl0IGxvb2tzIGxpa2UgSSBzaG91bGQgY2hlcnJ5IHBpY2sgdG8gZHJtLW1pc2Mt
Zml4ZXMgZm9yIGl0IHRvIHNob3cKdXAgaW4gNS40PwoKTm9yYWxmLgoKPj4gKEkga25vdyB0aGVy
ZSdzIGEgZmxvd2NoYXJ0IGluIHRoZSBkb2NzIGJ1dCBJJ3ZlIG5ldmVyIHJlYWxseSB1bmRlcnN0
b29kCj4+IGl0LikKPiAKPiBVc3VhbGx5IGJ1Z2ZpeGVzIGZvciBrZXJuZWwgcmVsZWFzZXMgc2hv
dWxkIGxhbmQgaW4gZHJtLW1pc2MtbmV4dC1maXhlcyBvcgo+IGRybS1taXNjLWZpeGVzLiBCdXQg
Y2hlcnJ5LXBpY2tpbmcgb3ZlciBpbiBjYXNlIG9mIG1pc3Rha2VzIGlzIG9rIHRvby4KPiAtRGFu
aWVsCj4gCj4+Cj4+IE5vcmFsZi4KPj4KPj4gRGVuIDAxLjEwLjIwMTkgMTUuNDUsIHNrcmV2IEph
c29uIEd1bnRob3JwZToKPj4+IE9uIFR1ZSwgT2N0IDAxLCAyMDE5IGF0IDAzOjI4OjQ2UE0gKzAy
MDAsIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4gRGVuIDAxLjEwLjIwMTkg
MTQuMzYsIHNrcmV2IEphc29uIEd1bnRob3JwZToKPj4+Pj4gT24gVGh1LCBKdWwgMjUsIDIwMTkg
YXQgMTI6NTE6MzBQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+Pj4+Pj4gVGhpcyBt
YWtlcyB0aGUgdGlueSBkcml2ZXJzIHZpc2libGUgYnkgZGVmYXVsdCB3aXRob3V0IGhhdmluZyB0
byBlbmFibGUgYQo+Pj4+Pj4ga25vYi4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBOb3Jh
bGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPj4+Pj4+IFJldmlld2VkLWJ5OiBIYW5z
IGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPiB0byBpdCBvbmNlCj4+Pj4+PiAgZHJpdmVy
cy9ncHUvZHJtL01ha2VmaWxlICAgICAgICB8ICAyICstCj4+Pj4+PiAgZHJpdmVycy9ncHUvZHJt
L3Rpbnlkcm0vS2NvbmZpZyB8IDM3ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+
Pj4+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0p
Cj4+Pj4+Cj4+Pj4+IEJpc2VjdGlvbiBzYXlzIHRoaXMgcGF0Y2ggKDI4YzQ3ZTE2ZWEyYTE5YWRi
NDdmZTJjMTgyY2JkNjFjYjg1NDIzN2MpCj4+Pj4+IGJyZWFrcyBrY29uZmlnIHN0dWZmIGluIHY1
LjQtcmMgYnkgY3JlYXRpbmcgY2lyY3VsYXIKPj4+Pj4gZGVwZW5kZW5jaWVzLiBDb3VsZCBzb21l
b25lIHNlbmQgYSAtcmMgcGF0Y2ggdG8gZml4IHRoaXMgcGxlYXNlPwo+Pj4+Pgo+Pj4+PiBUSElO
S1BBRF9BQ1BJIChkZWZpbmVkIGF0IGRyaXZlcnMvcGxhdGZvcm0veDg2L0tjb25maWc6NDg0KSwg
d2l0aCBkZWZpbml0aW9uLi4uCj4+Pj4+IC4uLmRlcGVuZHMgb24gRkJfU1NEMTMwNyAoZGVmaW5l
ZCBhdCBkcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWc6MjI1OSksIHdpdGggZGVmaW5pdGlvbi4u
Lgo+Pj4+PiAuLi5kZXBlbmRzIG9uIEZCIChkZWZpbmVkIGF0IGRyaXZlcnMvdmlkZW8vZmJkZXYv
S2NvbmZpZzoxMiksIHdpdGggZGVmaW5pdGlvbi4uLgo+Pj4+PiAuLi5kZXBlbmRzIG9uIERSTV9L
TVNfRkJfSEVMUEVSIChkZWZpbmVkIGF0IGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnOjc5KSwgd2l0
aCBkZWZpbml0aW9uLi4uCj4+Pj4+IC4uLmRlcGVuZHMgb24gRFJNX0tNU19IRUxQRVIgKGRlZmlu
ZWQgYXQgZHJpdmVycy9ncHUvZHJtL0tjb25maWc6NzMpLCB3aXRoIGRlZmluaXRpb24uLi4KPj4+
Pj4gLi4uZGVwZW5kcyBvbiBUSU5ZRFJNX1JFUEFQRVIgKGRlZmluZWQgYXQgZHJpdmVycy9ncHUv
ZHJtL3Rpbnlkcm0vS2NvbmZpZzo1MSksIHdpdGggZGVmaW5pdGlvbi4uLgo+Pj4+PiAuLi5kZXBl
bmRzIG9uIFRIRVJNQUwgKGRlZmluZWQgYXQgZHJpdmVycy90aGVybWFsL0tjb25maWc6NiksIHdp
dGggZGVmaW5pdGlvbi4uLgo+Pj4+PiAuLi5kZXBlbmRzIG9uIFNFTlNPUlNfTlBDTTdYWCAoZGVm
aW5lZCBhdCBkcml2ZXJzL2h3bW9uL0tjb25maWc6MTI4NSksIHdpdGggZGVmaW5pdGlvbi4uLgo+
Pj4+PiAuLi5kZXBlbmRzIG9uIEhXTU9OIChkZWZpbmVkIGF0IGRyaXZlcnMvaHdtb24vS2NvbmZp
Zzo2KSwgd2l0aCBkZWZpbml0aW9uLi4uCj4+Pj4+IC4uLmRlcGVuZHMgb24gVEhJTktQQURfQUNQ
SSAoZGVmaW5lZCBhdCBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9LY29uZmlnOjQ4NCksIHdpdGggZGVm
aW5pdGlvbi4uLgo+Pj4+PiAuLi5kZXBlbmRzIG9uIEFDUElfVklERU8gKGRlZmluZWQgYXQgZHJp
dmVycy9hY3BpL0tjb25maWc6MTkzKSwgd2l0aCBkZWZpbml0aW9uLi4uCj4+Pj4+IC4uLmRlcGVu
ZHMgb24gQUNFUl9XTUkgKGRlZmluZWQgYXQgZHJpdmVycy9wbGF0Zm9ybS94ODYvS2NvbmZpZzox
OSksIHdpdGggZGVmaW5pdGlvbi4uLgo+Pj4+PiAuLi5kZXBlbmRzIG9uIEJBQ0tMSUdIVF9DTEFT
U19ERVZJQ0UgKGRlZmluZWQgYXQgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZpZzoxNDQp
LCB3aXRoIGRlZmluaXRpb24uLi4KPj4+Pj4gLi4uZGVwZW5kcyBhZ2FpbiBvbiBUSElOS1BBRF9B
Q1BJIChkZWZpbmVkIGF0IGRyaXZlcnMvcGxhdGZvcm0veDg2L0tjb25maWc6NDg0KQo+Pj4+Pgo+
Pj4+Cj4+Pj4gV291bGQgdGhpcyBjb21taXQgZml4IHRoaXMgYnkgYW55IGNoYW5jZToKPj4+Pgo+
Pj4+IGRybS90aW55OiBLY29uZmlnOiBSZW1vdmUgYWx3YXlzLXkgVEhFUk1BTCBkZXAuIGZyb20g
VElOWURSTV9SRVBBUEVSCj4+Pj4gaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJt
LW1pc2MvY29tbWl0Lz9pZD1kZmVmOTU5ODAzYzcyOGM2MTZhZDI5YjAwOGNkOTFiMzQ0NmE5OTNh
Cj4+Pgo+Pj4gWWVzLCB0aGFuayB5b3UsIGNhbiBzb21lb25lIHNlbmQgdGhpcyB0byAtcmMgdG8g
dW5icmVhayA1LjQ/Cj4+Pgo+Pj4gSmFzb24KPj4+Cj4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
