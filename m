Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F34B1182AB1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479826EA6A;
	Thu, 12 Mar 2020 08:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from web0081.zxcs.nl (web0081.zxcs.nl [IPv6:2a06:2ec0:1::81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890046E96D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 10:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=pascalroeleven.nl; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KUYFXWlpQlmFH24r8Wc5r2V9DxU5tyqeUGSEwgUr8+Q=; b=fVlYSUL8RtKiaLK+JCly783CUT
 bQDL7isowG8X1gOXi2I85W5/gMHUHIC4FSzD8OW1/o61mz0vWnRudp/zGM5c3t0qzaa7i8ETgfqqf
 a8KVpjSFwT4VR0KeXhB2LxdDqpCRIe2GiAaceLOEOBIKLgIFfn9EW6JNzqEGo2dGrOdgCB+pfzAit
 b9pMpMjFeD0QwAipMjZGS5alpouqBRrbGS/0cSEtx3bWL9YL50o+Sr0WDooGTSiQSLWiv3UtAE4Us
 Nkfae1FhXs5St/J1DAjVMf1MA/eKiVIAtcNOr56M10d7vcZ6VBQDIIc2jadGIvKUBlGU51V+6fQf2
 3/DMnvhQ==;
Received: from spamrelay.zxcs.nl ([185.104.28.12]:33546
 helo=mail-slave01.zxcs.nl)
 by web0081.zxcs.nl with esmtp (Exim 4.92.3)
 (envelope-from <dev@pascalroeleven.nl>)
 id 1jByWN-000AQ6-8k; Wed, 11 Mar 2020 11:23:27 +0100
MIME-Version: 1.0
Date: Wed, 11 Mar 2020 11:23:27 +0100
From: Pascal Roeleven <dev@pascalroeleven.nl>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/2] drm/panel: Add Starry KR070PE2T
In-Reply-To: <20200310185422.GA22095@ravnborg.org>
References: <20200310102725.14591-1-dev@pascalroeleven.nl>
 <20200310102725.14591-2-dev@pascalroeleven.nl>
 <20200310185422.GA22095@ravnborg.org>
User-Agent: Roundcube Webmail/1.4.2
Message-ID: <280a128711458950b55b070dbf6f07a1@pascalroeleven.nl>
X-Sender: dev@pascalroeleven.nl
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wMy0xMCAxOTo1NCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IEEgZmV3IHRoaW5ncyB0
byBpbXByb3ZlLgo+IAo+IFRoZSBiaW5kaW5nIHNob3VsZCBiZSBhIHNlcGFyYXRlIHBhdGNoLgo+
IHN1YmplY3QgLSBzaGFsbCBzdGFydCB3aXRoIGR0LWJpbmRpbmdzOgo+IFNoYWxsIGJlIHNlbnQg
dG8gZGV2ZWljZXRyZWUgbWFpbGluZyBsaXN0LgoKSGkgU2FtLAoKVGhhbmsgeW91IHZlcnkgbXVj
aCBmb3IgeW91ciByZXZpZXcuCkkgZGlkIGNvbnNpZGVyIHRoaXMuIFRoZSByZWFzb24gSSBjb21i
aW5lZCB0aGUgcGF0Y2hlcywgaXMgdGhhdCB0aGUgCmJpbmRpbmcgZGVwZW5kcyBvbiB0aGUgZGlz
cGxheSBzbyBJIHRob3VnaHQgdGhleSB3ZXJlIHJlbGF0ZWQgaW4gc29tZSAKd2F5LiBEaWRuJ3Qg
a25vdyB0aGUgY29ycmVjdCBwcm9jZWR1cmUgdG8gaGFuZGxlIHRoaXMuIEkgd2lsbCBzcGxpdCB0
aGVtIAphcGFydCBpbiB2Mi4KCj4+IC0tLQo+PiAgLi4uL2Rpc3BsYXkvcGFuZWwvc3RhcnJ5LGty
MDcwcGUydC50eHQgICAgICAgIHwgIDcgKysrKysKPj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC1zaW1wbGUuYyAgICAgICAgICB8IDI2IAo+PiArKysrKysrKysrKysrKysrKysrCj4+ICAy
IGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCAK
Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc3RhcnJ5
LGtyMDcwcGUydC50eHQKPj4gCj4+IGRpZmYgLS1naXQgCj4+IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc3RhcnJ5LGtyMDcwcGUydC50eHQgCj4+IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc3RhcnJ5LGty
MDcwcGUydC50eHQKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwLi42
OTlhZDVlYjIKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgCj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc3RhcnJ5LGtyMDcwcGUydC50eHQKPj4gQEAg
LTAsMCArMSw3IEBACj4+ICtTdGFycnkgNyIgKDgwMHg0ODAgcGl4ZWxzKSBMQ0QgcGFuZWwKPj4g
Kwo+PiArUmVxdWlyZWQgcHJvcGVydGllczoKPj4gKy0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJz
dGFycnksa3IwNzBwZTJ0Igo+PiArCj4+ICtUaGlzIGJpbmRpbmcgaXMgY29tcGF0aWJsZSB3aXRo
IHRoZSBzaW1wbGUtcGFuZWwgYmluZGluZywgd2hpY2ggaXMgCj4+IHNwZWNpZmllZAo+PiAraW4g
c2ltcGxlLXBhbmVsLnR4dCBpbiB0aGlzIGRpcmVjdG9yeS4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtc2ltcGxlLmMKPj4gaW5kZXggZTE0YzE0YWM2Li4wMjdhMjYxMmIgMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPj4gQEAgLTI4NDIsNiArMjg0MiwyOSBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgCj4+IHNoZWxseV9zY2EwNzAxMF9iZm5f
bG5uID0gewo+PiAgCS5idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9SR0I2NjZfMVgxOCwKPj4g
IH07Cj4+IAo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHN0YXJyeV9r
cjA3MHBlMnRfbW9kZSA9IHsKPj4gKwkuY2xvY2sgPSAzMzAwMCwKPj4gKwkuaGRpc3BsYXkgPSA4
MDAsCj4+ICsJLmhzeW5jX3N0YXJ0ID0gODAwICsgMjA5LAo+PiArCS5oc3luY19lbmQgPSA4MDAg
KyAyMDkgKyAxLAo+PiArCS5odG90YWwgPSA4MDAgKyAyMDkgKyAxICsgNDUsCj4+ICsJLnZkaXNw
bGF5ID0gNDgwLAo+PiArCS52c3luY19zdGFydCA9IDQ4MCArIDIyLAo+PiArCS52c3luY19lbmQg
PSA0ODAgKyAyMiArIDEsCj4+ICsJLnZ0b3RhbCA9IDQ4MCArIDIyICsgMSArIDIyLAo+PiArCS52
cmVmcmVzaCA9IDYwLAo+PiArfTsKPiAKPiBQbGVhc2UgYWRqdXN0IHNvOgo+IHZyZWZyZXNoICog
aHRvdGFsICogdnRvdGFsID09IGNsb2NrLgo+IEkgY2Fubm90IHNheSB3aGF0IG5lZWRzIHRvIGJl
IGFkanVzdGVkLgo+IEJ1dCB3ZSBhcmUgbW92aW5nIGF3YXkgZnJvbSBzcGVjaWZ5aW5nIHZyZWZy
ZXNoIGFuZCB3YW50IHRoZQo+IGRhdGEgdG8gYmUgT0suCgpKdXN0IGxpa2UgVmlsbGUgU3lyasOk
bMOkLCBJIHJhbiB0aGUgbnVtYmVycyBhbmQgdnJlZnJlc2ggaW5kZWVkIApjYWxjdWxhdGVzIHRv
IDU5LjU4LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
