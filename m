Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C37B8BEE
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AED36F74B;
	Fri, 20 Sep 2019 07:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs27.siol.net [185.57.226.218])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D129E6F91E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 18:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id D85765236A1;
 Thu, 19 Sep 2019 20:53:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id SD6JFhZtoeQ4; Thu, 19 Sep 2019 20:53:11 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 845B952374C;
 Thu, 19 Sep 2019 20:53:11 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net
 [86.58.59.25]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 4BB805236A1;
 Thu, 19 Sep 2019 20:53:11 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: roman.stratiienko@globallogic.com
Subject: Re: drm/sun4i: Add missing pixel formats to the vi layer
Date: Thu, 19 Sep 2019 20:53:10 +0200
Message-ID: <9229663.7SG9YZCNdo@jernej-laptop>
In-Reply-To: <20190918110541.38124-1-roman.stratiienko@globallogic.com>
References: <20190918110541.38124-1-roman.stratiienko@globallogic.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:39 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpEbmUgc3JlZGEsIDE4LiBzZXB0ZW1iZXIgMjAxOSBvYiAxMzowNTo0MSBDRVNUIGplIApy
b21hbi5zdHJhdGlpZW5rb0BnbG9iYWxsb2dpYy5jb20gbmFwaXNhbChhKToKPiBGcm9tOiBSb21h
biBTdHJhdGlpZW5rbyA8cm9tYW4uc3RyYXRpaWVua29AZ2xvYmFsbG9naWMuY29tPgo+IAo+IEFj
Y29yZGluZyB0byBBbGx3aW5uZXIgREUyLjAgU3BlY2lmaWNhdGlvbiBSRVYgMS4wLCB2aSBsYXll
ciBzdXBwb3J0cyB0aGUKPiBmb2xsb3dpbmcgcGl4ZWwgZm9ybWF0czogIEFCR1JfODg4OCwgQVJH
Ql84ODg4LCBCR1JBXzg4ODgsIFJHQkFfODg4OAoKSXQncyB0cnVlIHRoYXQgREUyIFZJIGxheWVy
cyBzdXBwb3J0IHRob3NlIGZvcm1hdHMsIGJ1dCBpdCB3b3VsZG4ndCBjaGFuZ2UgCmFueXRoaW5n
IGJlY2F1c2UgYWxwaGEgYmxlbmRpbmcgaXMgbm90IHN1cHBvcnRlZCBieSB0aG9zZSBwbGFuZXMu
IFRoZXNlIApmb3JtYXRzIHdlcmUgZGVsaWJlcmF0ZWx5IGxlZnQgb3V0IGJlY2F1c2UgdGhlaXIg
Y291bnRlcnBhcnRzIHdpdGhvdXQgYWxwaGEgCmV4aXN0LCBmb3IgZXhhbXBsZSBBQkdSODg4OCA8
LT4gWEJHUjg4ODguIEl0IHdvdWxkIGFsc28gY29uZnVzZSB1c2VyLCB3aGljaCAKd291bGQgZXhw
ZWN0IHRoYXQgYWxwaGEgYmxlbmRpbmcgd29ya3MgaWYgZm9ybWF0IHdpdGggYWxwaGEgY2hhbm5l
bCBpcyAKc2VsZWN0ZWQuCgpBZG1pdHRlZGx5IHNvbWUgZm9ybWF0cyB3aXRoIGFscGhhIGFyZSBz
dGlsbCByZXBvcnRlZCBhcyBzdXBwb3J0ZWQgZHVlIHRvIGxhY2sgCm9mIHRoZWlyIGNvdW50ZXJw
YXJ0cyB3aXRob3V0IGFscGhhLCBidXQgSSdtIGZpbmUgd2l0aCByZW1vdmluZyB0aGVtIGZvciAK
Y29uc2lzdGVuY3kuCgpCZXN0IHJlZ2FyZHMsCkplcm5lagoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBS
b21hbiBTdHJhdGlpZW5rbyA8cm9tYW4uc3RyYXRpaWVua29AZ2xvYmFsbG9naWMuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdmlfbGF5ZXIuYyB8IDQgKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9zdW40aS9zdW44aV92aV9sYXllci5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkv
c3VuOGlfdmlfbGF5ZXIuYyBpbmRleCBiZDBlNmE1MmQxZDguLjA3YzI3ZTZhNGI3Nwo+IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV92aV9sYXllci5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX3ZpX2xheWVyLmMKPiBAQCAtNDA0LDE3ICs0MDQs
MjEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fcGxhbmVfZnVuY3MKPiBzdW44aV92aV9sYXll
cl9mdW5jcyA9IHsgc3RhdGljIGNvbnN0IHUzMiBzdW44aV92aV9sYXllcl9mb3JtYXRzW10gPSB7
Cj4gIAlEUk1fRk9STUFUX0FCR1IxNTU1LAo+ICAJRFJNX0ZPUk1BVF9BQkdSNDQ0NCwKPiArCURS
TV9GT1JNQVRfQUJHUjg4ODgsCj4gIAlEUk1fRk9STUFUX0FSR0IxNTU1LAo+ICAJRFJNX0ZPUk1B
VF9BUkdCNDQ0NCwKPiArCURSTV9GT1JNQVRfQVJHQjg4ODgsCj4gIAlEUk1fRk9STUFUX0JHUjU2
NSwKPiAgCURSTV9GT1JNQVRfQkdSODg4LAo+ICAJRFJNX0ZPUk1BVF9CR1JBNTU1MSwKPiAgCURS
TV9GT1JNQVRfQkdSQTQ0NDQsCj4gKwlEUk1fRk9STUFUX0JHUkE4ODg4LAo+ICAJRFJNX0ZPUk1B
VF9CR1JYODg4OCwKPiAgCURSTV9GT1JNQVRfUkdCNTY1LAo+ICAJRFJNX0ZPUk1BVF9SR0I4ODgs
Cj4gIAlEUk1fRk9STUFUX1JHQkE0NDQ0LAo+ICAJRFJNX0ZPUk1BVF9SR0JBNTU1MSwKPiArCURS
TV9GT1JNQVRfUkdCQTg4ODgsCj4gIAlEUk1fRk9STUFUX1JHQlg4ODg4LAo+ICAJRFJNX0ZPUk1B
VF9YQkdSODg4OCwKPiAgCURSTV9GT1JNQVRfWFJHQjg4ODgsCgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
