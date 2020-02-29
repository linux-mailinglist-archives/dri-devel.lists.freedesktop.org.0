Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BD51747E3
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 17:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF356E36F;
	Sat, 29 Feb 2020 16:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Sat, 29 Feb 2020 16:09:16 UTC
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by gabe.freedesktop.org (Postfix) with SMTP id 982BD6E36F
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Feb 2020 16:09:16 +0000 (UTC)
Received: (qmail 16922 invoked by uid 500); 29 Feb 2020 11:02:34 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
 by localhost with SMTP; 29 Feb 2020 11:02:34 -0500
Date: Sat, 29 Feb 2020 11:02:34 -0500 (EST)
From: Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Subject: Re: [RFC 2/9] mfd: Add driver for Multifunction USB Device
In-Reply-To: <58bf66ef-d772-83cf-a13c-2a1135e12560@tronnes.org>
Message-ID: <Pine.LNX.4.44L0.2002291053240.16560-100000@netrider.rowland.org>
MIME-Version: 1.0
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
Cc: balbi@kernel.org, broonie@kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyOSBGZWIgMjAyMCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgoKPiA+PiArc3RhdGlj
IHZvaWQgbXVkX2lycV91cmJfY29tcGxldGlvbihzdHJ1Y3QgdXJiICp1cmIpCj4gPj4gK3sKPiA+
PiArCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZ1cmItPmRldi0+ZGV2Owo+ID4+ICsJaW50IHJldDsK
PiA+PiArCj4gPj4gKwltZGVidWcoIiVzOiBhY3R1YWxfbGVuZ3RoPSV1XG4iLCBfX2Z1bmNfXywg
dXJiLT5hY3R1YWxfbGVuZ3RoKTsKPiA+PiArCj4gPj4gKwlzd2l0Y2ggKHVyYi0+c3RhdHVzKSB7
Cj4gPj4gKwljYXNlIDA6Cj4gPj4gKwkJbXVkX2lycV9xdWV1ZSh1cmIpOwo+ID4+ICsJCWJyZWFr
Owo+ID4+ICsJY2FzZSAtRVBST1RPOgkvKiBGSVhNRTogdmVyaWZ5OiBkd2MyIHJlcG9ydHMgdGhp
cyBvbiBkaXNjb25uZWN0ICovCj4gPiAKPiA+IFdoYXQgZG9lcyB0aGlzIG1lYW4/ICBXaHkgY2Fu
J3QgeW91IGZpeCBpdCBub3c/Cj4gCj4gSSBkb24ndCBrbm93IGlmIHRoaXMgaXMgYSBkd2MyIGRy
aXZlciBwcm9ibGVtIG9yIGlmIEVQUk9UTyBpcyBhIHZhbGlkCj4gZGlzY29ubmVjdCBlcnJvci4g
SSBoYXZlbid0IHNlZW4gaXQgaW4gb3RoZXIgZ2FkZ2V0IGRyaXZlcnMsIHNvIEkgbmVlZAoKTm90
ZTogVGhpcyBpcyBub3QgYSBnYWRnZXQgZHJpdmVyLiAgWW91IHNob3VsZCBiZSBsb29raW5nIGlu
IGRldmljZSAKZHJpdmVycy4KCj4gdG8gbG9vayBtb3JlIGludG8gdGhpcyBvciBldmVuIGJldHRl
ciBpZiBzb21lb25lIGZyb20gVVNCIGNhbiBhbnN3ZXIgdGhpcy4KClNlZSBEb2N1bWVudGF0aW9u
L2RyaXZlci1hcGkvdXNiL2Vycm9yLWNvZGVzLnJzdC4gIEluIHNob3J0LCAtRVBST1RPIGlzCm9u
ZSBvZiBzZXZlcmFsIHN0YXR1cyBjb2RlcyB5b3UgbWF5IGdldCB3aGVuIGFuIFVSQiBmYWlscyBi
ZWNhdXNlIHRoZQpkZXZpY2Ugd2FzIGRpc2Nvbm5lY3RlZC4KCj4gPj4gKwljYXNlIC1FQ09OTlJF
U0VUOgo+ID4+ICsJY2FzZSAtRU5PRU5UOgo+ID4+ICsJY2FzZSAtRVNIVVRET1dOOgo+ID4+ICsJ
CWRldl9kYmcoZGV2LCAiaXJxIHVyYiBzaHV0dGluZyBkb3duIHdpdGggc3RhdHVzOiAlZFxuIiwg
dXJiLT5zdGF0dXMpOwo+ID4gCj4gPiBzL2lycS9JUlEvIGluIGFsbCBjb21tZW50cyBhbmQgcHJp
bnRzLgo+ID4gCj4gPiBTYW1lIHdpdGggVVJCPwo+ID4gCj4gPj4gKwkJcmV0dXJuOwo+ID4+ICsJ
ZGVmYXVsdDoKPiA+PiArCQlkZXZfZGJnKGRldiwgImlycSB1cmIgZmFpbHVyZSB3aXRoIHN0YXR1
czogJWRcbiIsIHVyYi0+c3RhdHVzKTsKPiA+PiArCQlicmVhazsKPiA+IAo+ID4gU28gaXQncyBm
YWlsZWQsIGJ1dCB5b3UncmUgZ29pbmcgdG8gYXR0ZW1wdCB0byBzdWJtaXQgaXQgYW55d2F5Pwo+
IAo+IFllcywgSSBkb24ndCBrbm93IHRoZSByZWFzb24gd2h5IGl0IGZhaWxlZCwgaXQgbWlnaHQg
c3VjY2VlZCB0aGUgbmV4dAo+IHRpbWUuIEJ1dCB0aGlzIGlzIGFsc28gc29tZXRoaW5nIHRoYXQg
c29tZW9uZSB3aXRoIHJlYWwgbGlmZSBleHBlcmllbmNlCj4gd2l0aCBVU0IgZmFpbHVyZXMgY291
bGQgd2VpZ2ggaW4gb24uIE1heWJlIEkgc2hvdWxkIHNlbmQgYSByZXNldCByZXF1ZXN0Cj4gc28g
dGhlIGRldmljZSBjYW4gcmVzZXQgaXRzIHN0YXRlIG1hY2hpbmUsIEkgZG9uJ3Qga25vdy4KClVT
QiBjb25uZWN0aW9ucyBhcmUgdXN1YWxseSBwcmV0dHkgcmVsaWFibGUuICBTb21ldGltZXMgdGhl
cmUgYXJlCnRyYW5zaWVudCBlcnJvcnMsIGJ1dCB0aGV5IGFyZSByZWxhdGl2ZWx5IHJhcmUuICBO
byBvbmUgd291bGQgY3JpdGljaXplCmEgZHJpdmVyIGZvciBnaXZpbmcgdXAgdGhlIGZpcnN0IHRp
bWUgaXQgZ2V0cyBhbiBlcnJvciAoZXNwZWNpYWxseSBpZgp0aGVyZSB3YXMgYW4gZWFzeSB3YXkg
dG8gcmVzZXQgaXQpIC0tIGJ1dCBwZW9wbGUgd2lsbCBnZXQgYW5ub3llZCBpZiBhCnRvbiBvZiBl
cnJvciBtZXNzYWdlcyBzaG93cyB1cCBvbiB0aGUgY29uc29sZSB3aGVuZXZlciB0aGV5IHVucGx1
ZyB0aGUKZGV2aWNlLgoKSW4gZ2VuZXJhbCwgdGhlIG92ZXJhbGwgZGVzaWduIG9mIHRoZSBkcml2
ZXIgc2VlbXMgdG8gYmUgcmVhc29uYWJsZS4gIApJIGNhbid0IGp1ZGdlIHRoZSBpbnRlcmZhY2Vz
IHdpdGggb3RoZXIgc3Vic3lzdGVtcyBvciB0aGUgb3RoZXIgYXNwZWN0cwpvZiB0aGVpciBkZXNp
Z24sIGJ1dCB0aGUgVVNCIHBhcnQgaXMgb2theS4gIChJIGhhdmVuJ3QgZ29uZSB0aHJvdWdoIGl0
CmluIGRldGFpbC4pCgpBbGFuIFN0ZXJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
