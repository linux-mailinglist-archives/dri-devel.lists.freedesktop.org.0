Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFBE67A74
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2019 16:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC64389CB8;
	Sat, 13 Jul 2019 14:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3034F894C5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 12:43:44 +0000 (UTC)
Received: from [167.98.27.226] (helo=[10.35.6.255])
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hlutl-0005uA-Hz; Fri, 12 Jul 2019 13:43:37 +0100
Subject: Re: [PATCH v1 08/11] dt-bindings: display/bridge: Add bindings for
 ti949
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190611140412.32151-1-michael.drake@codethink.co.uk>
 <20190611140412.32151-9-michael.drake@codethink.co.uk>
 <20190611181351.GW5016@pendragon.ideasonboard.com>
From: Michael Drake <michael.drake@codethink.co.uk>
Message-ID: <534c485b-2074-1fcc-2d8f-11e5a9f278e4@codethink.co.uk>
Date: Fri, 12 Jul 2019 13:43:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190611181351.GW5016@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 13 Jul 2019 14:24:23 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nate Case <ncase@tesla.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@lists.codethink.co.uk,
 Patrick Glaser <pglaser@tesla.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCk9uIDExLzA2LzIwMTkgMTk6MTMsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6
Cj4gSGkgTWljaGFlbCwKPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk15IHBsZWFzdXJl
LCBhbmQgdGhhbmsgeW91IGZvciB0aGUgZmVlZGJhY2shCgo+IE9uIFR1ZSwgSnVuIDExLCAyMDE5
IGF0IDAzOjA0OjA5UE0gKzAxMDAsIE1pY2hhZWwgRHJha2Ugd3JvdGU6Cj4+IEFkZHMgZGV2aWNl
IHRyZWUgYmluZGluZ3MgZm9yOgo+Pgo+PiAgIFRJIERTOTBVQjk0OS1RMSAxMDgwcCBIRE1JIHRv
IEZQRC1MaW5rIElJSSBicmlkZ2Ugc2VyaWFsaXplcgo+Pgo+PiBJdCBzdXBwb3J0cyBpbnN0YW50
aWF0aW9uIHZpYSBkZXZpY2UgdHJlZSAvIEFDUEkgdGFibGUuCj4+Cj4+IFRoZSBkZXZpY2UgaGFz
IHRoZSBjb21wYXRpYmxlIHN0cmluZyAidGksZHM5MHViOTQ5IiwgYW5kCj4+IGFuZCBhbGxvd3Mg
YW4gYXJycmF5IG9mIHN0cmluZ3MgdG8gYmUgcHJvdmlkZWQgYXMgcmVndWxhdG9yCj4+IG5hbWVz
IHRvIGVuYWJsZSBmb3Igb3BlcmF0aW9uIG9mIHRoZSBkZXZpY2UuCj4gCj4gQWxsIHRoZSBjb21t
ZW50cyBJIG1hZGUgcmVnYXJkaW5nIHRoZSBkczkwdWI5NDggRFQgYmluZGluZ3MgYXBwbHkgaGVy
ZQo+IHRvby4gU2FtZSBmb3IgdGhlIGNvbW1lbnRzIHJlbGF0ZWQgdG8gdGhlIGRyaXZlciwgdGhl
eSBhcHBseSB0byB0aGUKPiBzdWJzZXF1ZW50IHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMuCgpPSywg
dW5kZXJzdG9vZC4KClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHRoZSByZXZpZXcuCgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBNaWNoYWVsIERyYWtlIDxtaWNoYWVsLmRyYWtlQGNvZGV0aGluay5jby51az4K
Pj4gQ2M6IFBhdHJpY2sgR2xhc2VyIDxwZ2xhc2VyQHRlc2xhLmNvbT4KPj4gQ2M6IE5hdGUgQ2Fz
ZSA8bmNhc2VAdGVzbGEuY29tPgo+PiAtLS0KPj4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2JyaWRn
ZS90aSxkczkwdWI5NDkudHh0ICB8IDI0ICsrKysrKysrKysrKysrKysrKysKPj4gIDEgZmlsZSBj
aGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLGRzOTB1Yjk0OS50eHQK
Pj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS90aSxkczkwdWI5NDkudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLGRzOTB1Yjk0OS50eHQKPj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi4zYmEzODk3ZDVlODEKPj4gLS0tIC9kZXYvbnVs
bAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvdGksZHM5MHViOTQ5LnR4dAo+PiBAQCAtMCwwICsxLDI0IEBACj4+ICtUSSBEUzkwVUI5NDkt
UTEgMTA4MHAgSERNSSB0byBGUEQtTGluayBJSUkgYnJpZGdlIHNlcmlhbGl6ZXIKPj4gKz09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+
PiArCj4+ICtUaGlzIGlzIHRoZSBiaW5kaW5nIGZvciBUZXhhcyBJbnN0cnVtZW50cyBEUzkwVUI5
NDktUTEgYnJpZGdlIHNlcmlhbGl6ZXIuCj4+ICsKPj4gK1RoaXMgZGV2aWNlIHN1cHBvcnRzIEky
QyBvbmx5Lgo+PiArCj4+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+PiArCj4+ICstIGNvbXBhdGli
bGU6ICJ0aSxkczkwdWI5NDkiCj4+ICsKPj4gK09wdGlvbmFsIHByb3BlcnRpZXM6Cj4+ICsKPj4g
Ky0gcmVndWxhdG9yczogTGlzdCBvZiByZWd1bGF0b3IgbmFtZSBzdHJpbmdzIHRvIGVuYWJsZSBm
b3Igb3BlcmF0aW9uIG9mIGRldmljZS4KPj4gKwo+PiArRXhhbXBsZQo+PiArLS0tLS0tLQo+PiAr
Cj4+ICt0aTk0OTogZHM5MHViOTQ5QDAgewo+PiArCWNvbXBhdGlibGUgPSAidGksZHM5MHViOTQ5
IjsKPj4gKwo+PiArCXJlZ3VsYXRvcnM6ICJ2Y2MiLAo+PiArCSAgICAgICAgICAgICJ2Y2NfaGRt
aSI7Cj4+ICt9Owo+IAoKLS0gCk1pY2hhZWwgRHJha2UgICAgICAgICAgICAgICAgIGh0dHBzOi8v
d3d3LmNvZGV0aGluay5jby51ay8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
