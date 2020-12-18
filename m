Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 632702DDF52
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:01:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92CB892CF;
	Fri, 18 Dec 2020 08:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C869892CF
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 08:01:16 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BI819MM074020;
 Fri, 18 Dec 2020 02:01:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608278469;
 bh=xcTb8qYiKGxzuikMSclKbE3udkTmV/7/x9FE2GiyPCY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=M6kmSKQhQqfl9YhUZn+PY7onXrKICFx16ivOSLZEzuUwQxoNPbe7/LhS3qT/Zf/NC
 BFQDS48jCOjy0hf/NCOlfy135TosuJM4QUTjUlI7hz5gfIqfMvfUxcosZgSISs+M99
 RxoLxSc6bxk4QMKcSYSPMz+zUgvRfYaBgmzUqxkc=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BI819jR071370
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Dec 2020 02:01:09 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 18
 Dec 2020 02:01:08 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 18 Dec 2020 02:01:08 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BI815GB029687;
 Fri, 18 Dec 2020 02:01:06 -0600
Subject: Re: [PATCH] dt-bindings: display: bridge: tc358768: Remove maintainer
 information
To: Sam Ravnborg <sam@ravnborg.org>
References: <20201215124227.1872-1-peter.ujfalusi@ti.com>
 <1608042367.307112.3775381.nullmailer@robh.at.kernel.org>
 <90d45716-4f4e-7379-07fd-74eff793e498@ti.com>
 <20201217172556.GA1339623@ravnborg.org>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <dfc9fe88-40c6-93c8-4c25-a0c977579ebf@ti.com>
Date: Fri, 18 Dec 2020 10:02:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201217172556.GA1339623@ravnborg.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKT24gMTcvMTIvMjAyMCAxOS4yNSwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+Pj4gZHRz
Y2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoKPj4+IC9idWlsZHMvcm9iaGVycmluZy9saW51eC1k
dC1yZXZpZXcvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdl
L3Rvc2hpYmEsdGMzNTg3NjgueWFtbDogJ21haW50YWluZXJzJyBpcyBhIHJlcXVpcmVkIHByb3Bl
cnR5Cj4+PiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQtcmV2aWV3L0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90b3NoaWJhLHRjMzU4NzY4LnlhbWw6
IGlnbm9yaW5nLCBlcnJvciBpbiBzY2hlbWE6IAo+Pj4gd2FybmluZzogbm8gc2NoZW1hIGZvdW5k
IGluIGZpbGU6IC4vRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJp
ZGdlL3Rvc2hpYmEsdGMzNTg3NjgueWFtbAo+Pgo+PiBSaWdodCwgc28gaXQgaXMgbm90IHRoYXQg
ZWFzeSB0byBub3QgYmVlbiBhYmxlIHRvIG1haW50YWluIHRoaXMuLi4gOm8KPj4KPj4gV2hvIHNo
b3VsZCBiZSBkb2N1bWVudGVkIGFzIG1haW50YWluZXI/Cj4+IEFuZHJ6ZWosIE5laWwsIERhdmlk
IG9yIERhbmllbD8KPiAKPiBJIGhhdmUgbm8gcHJvYmxlbSBiZWluZyBsaXN0ZWQgYXMgbWFpbnRh
aW5lciBkZXNwaXRlIG15IHZlcnkgbGltaXRlZAo+IGtub3dsZWRnZSBvbiB0aGUgSFcuIFNvIHVu
bGVzcyB5b3UgZW5kIHVwIHZvbHVudGVlcmluZyB0aGVuIGp1c3QKPiBhZGQgbWUuCgp0aGFuayB5
b3UuIGl0IGlzIG5vdCBlYXN5IHRvIGdpdmUgdXAgb24gc29tZXRoaW5nIG9uZSBoYXMgc3BlbnQg
dGltZSBvbiwKYnV0IHdpdGhvdXQgdGhlIGhhcmR3YXJlIGFuZCBtYW51YWwgaXQgd291bGQgYmUg
bm90IHJpZ2h0IHRvIGp1c3QgbW92ZQppdCB0byBteSBwcml2YXRlIGVtYWlsIGFzIEkgZGlkIGZv
ciB0aGUgRE1BIGFuZCBBdWRpbyBkcml2ZXJzOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGtt
bC8yMDIwMTIxNTEzMDUxMi44NzUzLTEtcGV0ZXIudWpmYWx1c2lAdGkuY29tLwoKaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC8yMDIwMTIxNTEzMTM0OC4xMTI4Mi0xLXBldGVyLnVqZmFsdXNp
QHRpLmNvbS8KCkknbGwgc2VuZCB2MiBhcyBtYXkgbGFzdCBwYXRjaCBmcm9tIHRpLmNvbQoKLSBQ
w6l0ZXIKClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAw
MTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2th
L0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
