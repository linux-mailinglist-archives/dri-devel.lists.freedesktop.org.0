Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF6691164
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C56E6EAE0;
	Sat, 17 Aug 2019 15:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFD66E1B7
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 02:41:29 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 49DFB1729A906BC3EB0B;
 Fri, 16 Aug 2019 10:41:18 +0800 (CST)
Received: from [127.0.0.1] (10.57.77.74) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Fri, 16 Aug 2019
 10:41:09 +0800
Subject: Re: [PATCH 0/1] drm/hisilicon/hibmc: Make CONFIG_DRM_HISI_HIBMC
 depend on ARM64
To: Matthew Ruffell <matthew.ruffell@canonical.com>
References: <20190815042640.26938-1-matthew.ruffell@canonical.com>
From: xinliang <z.liuxinliang@hisilicon.com>
Message-ID: <5D5617C5.2000703@hisilicon.com>
Date: Fri, 16 Aug 2019 10:41:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20190815042640.26938-1-matthew.ruffell@canonical.com>
X-Originating-IP: [10.57.77.74]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
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
Cc: Guang Lou Yang <yangguanglou@huawei.com>,
 Zhanglei Mao <zhanglei.mao@canonical.com>, David Airlie <airlied@linux.ie>,
 Chen Feng <puck.chen@hisilicon.com>, dri-devel@lists.freedesktop.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Gavin Guo <gavin.guo@canonical.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDE5LzgvMTUgMTI6MjYsIE1hdHRoZXcgUnVmZmVsbCB3cm90ZToKPiBIaSwKPgo+IGFt
ZDY0IGJhc2VkIEh1YXdlaSBzZXJ2ZXJzIGhhdmUgcHJvYmxlbXMgd2hlcmUgdGhlIGRpc3BsYXkg
b3V0cHV0IG9mIHRoZWlyIGlCTUMKPiBjaGlwcyBpcyBicm9rZW4sIHJlc3VsdGluZyBpbiBhICJi
bHVycnkiIHNjcmVlbiB3aGVuIHZpZXdlZCBmcm9tIHRoZWlyIGluIGhvdXNlCj4gcmVtb3RlIGt2
bS1saWtlIGNvbnNvbGUuCj4KPiBFeGFtcGxlOgo+Cj4gaHR0cHM6Ly9sYXVuY2hwYWRsaWJyYXJp
YW4ubmV0LzM2NTkwNzY2OC9jcmVlbl9waWN0dXJlX2Zvcl9ibHVyLnBuZwo+Cj4gVGhlIGlzc3Vl
IGlzIGNhdXNlZCBieSB0aGUgaGlibWNfZHJtIGtlcm5lbCBtb2R1bGUgYmVpbmcgbG9hZGVkLiBU
aGUgUENJIElEIGZvcgo+IHRoZSBpQk1DIGNoaXBzIG9uIGFtZDY0IGhhcmR3YXJlIGlzIHRoZSBz
YW1lIGFzIGFybTY0IGhhcmR3YXJlLCBidXQgdGhlCj4gaGlibWNfZHJtIGRyaXZlciB3YXMgZGV2
ZWxvcGVkIG9ubHkgZm9yIHVzZSBvbiBhcm02NCBoYXJkd2FyZSwgbW9zdCBub3RhYmx5IGZvcgo+
IHRoZSBIdWF3ZWkgRDA1IGRldmVsb3BtZW50IGJvYXJkLgo+Cj4gVGhlIGltcGFjdCB0byBIdWF3
ZWkgaXMgdGhhdCB0aGVpciBjdXN0b21lcnMgY2Fubm90IHVzZSBVYnVudHUgc2VydmVyIGluc3Rh
bGwKPiBtZWRpYSBhcyB0aGUgc2NyZWVuIGdvZXMgImJsdXJyeSIgd2hlbiB0aGUgZC1pIGluc3Rh
bGwgbWVkaWEgb3Igc3VidXFpdHkKPiBpbnN0YWxsZXIgbG9hZHMgdGhlIGhpYm1jX2RybSBrZXJu
ZWwgbW9kdWxlIGFmdGVyIGxhbmd1YWdlIHNlbGVjdGlvbi4KPgo+IFRoZSBvbmx5IHdvcmthcm91
bmQgZm9yIHRoZWlyIGN1c3RvbWVycyBpcyB0byBwcmVzcyB0aGUgIkUiIGtleSBkdXJpbmcgdGhl
IHZlcnkKPiBmaXJzdCBpbnN0YWxsZXIgbWVudSBhbmQgYWRkaW5nICJtb2Rwcm9iZS5ibGFja2xp
c3Q9aGlibWNfZHJtIiB0byB0aGUga2VybmVsCj4gY29tbWFuZCBsaW5lIGluIHRoZSBncnViIG1l
bnUuIFRoaXMgaXMgbm90IGdvb2QgZm9yIGN1c3RvbWVyIGV4cGVyaWVuY2Ugd2l0aAo+IHRoZWly
IHNlcnZlcnMuCj4KPiBIdWF3ZWkgaGVscCBzaXRlIG9uIHRoZSBtYXR0ZXI6Cj4KPiBodHRwczov
L3N1cHBvcnQuaHVhd2VpLmNvbS9lbnRlcnByaXNlL2VuL2tub3dsZWRnZS9FS0IxMTAwMDE1NTIx
Cj4KPiBPdGhlciBwcm9ibGVtcyBleGlzdCBmb3IgdGhlIGhpYm1jX2RybSBkcml2ZXIgb24gYW1k
NjQsIHN1Y2ggYXMgd29ya2luZyBvbgo+IGJpb3MsIGJ1dCBub3QgdWVmaSwgYW5kIG5vdCBiZWlu
ZyB3YXlsYW5kIGNvbXBhdGlibGUsIG1ha2luZyB0aGUgc2NyZWVuICJibHVycnkiCj4gd2hlbmV2
ZXIgYSBkZXNrdG9wIHNlc3Npb24gaXMgc3RhcnRlZCBhbmQgZ2RtIGxvYWRlZC4KPgo+IE1vcmUg
aW5mb3JtYXRpb24gYWJvdXQgdGhlIGFib3ZlIGNhbiBiZSBmb3VuZCBvbiBMYXVuY2hwYWQ6Cj4K
PiBodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC9idWdzLzE3NjI5NDAKPgo+IEh1YXdlaSBoYXZl
IGFza2VkIHVzIHRvIHJlbW92ZSBoaWJtY19kcm0gZnJvbSBhbGwgYXJjaGl0ZWN0dXJlcyBleGNl
cHQgYXJtNjQsCj4gYW5kIHRoaXMgYWxpZ25zIHdpdGggYWR2aWNlIGZyb20gSGlzaWxpY29uLgo+
Cj4gSGlibWMgbWFpbnRhaW5lcnMsIGNhbiB5b3UgcGxlYXNlIHJldmlldyB0aGUgc3RhdHVzIG9m
IGhpYm1jX2RybSBvbiBhbWQ2NCBhbmQKPiBjb25maXJtIHRoYXQgdGhlc2UgaXNzdWVzIGV4aXN0
LCBhbmQgY29uc2lkZXIgbWVyZ2luZyB0aGUgcGF0Y2ggdG8gdXBkYXRlCj4gS2NvbmZpZyB0byBz
ZXQgQ09ORklHX0RSTV9ISVNJX0hJQk1DIGFybTY0IG9ubHkuCj4KPiBNYXR0aGV3IFJ1ZmZlbGwg
KDEpOgo+ICAgIGRybS9oaXNpbGljb24vaGlibWM6IE1ha2UgQ09ORklHX0RSTV9ISVNJX0hJQk1D
IGRlcGVuZCBvbiBBUk02NAo+Cj4gICBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL0tj
b25maWcgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKClRoYW5rcyBNYXR0aGV3IGZvciB0aGUgcGF0Y2guCkZvciB0aGUgcGF0Y2gsCkFja2Vk
LWJ5OiBYaW5saWFuZyBMaXUgPHoubGl1eGlubGlhbmdAaGlzaWxpY29uLmNvbT4KQW5kIGFwcGxp
ZWQgYW5kIHdpbGwgcHVzaCB0byBkcm0gbWFpbnRhaW5lciBzb29uLgoKVGhhbmtzLApYaW5saWFu
ZwoKPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
