Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E687218049
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567C66E879;
	Wed,  8 Jul 2020 07:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481B86E10B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 11:44:57 +0000 (UTC)
Received: from localhost (unknown [192.168.167.16])
 by lucky1.263xmail.com (Postfix) with ESMTP id 86B88C0994;
 Tue,  7 Jul 2020 19:44:53 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from [172.16.12.76] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P22500T140639612159744S1594122293842809_; 
 Tue, 07 Jul 2020 19:44:54 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <7ed9b2a78b31790478278814a2e85862>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: hjc@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_v2_1/2=5d_drm=3a_drm=5ffourcc=3a_add_NV20_?=
 =?UTF-8?B?YW5kIE5WMzAgWVVWIGZvcm1hdHPjgJDor7fms6jmhI/vvIzpgq7ku7bnlLFsaW51?=
 =?UTF-8?Q?x-rockchip-bounces+sandy=2ehuang=3drock-chips=2ecom=40lists=2einf?=
 =?UTF-8?B?cmFkZWFkLm9yZ+S7o+WPkeOAkQ==?=
To: Jonas Karlman <jonas@kwiboo.se>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>
References: <20200607202521.18438-1-jonas@kwiboo.se>
 <20200706223009.1200-1-jonas@kwiboo.se>
 <20200706223009.1200-2-jonas@kwiboo.se>
From: Huang Jiachai <hjc@rock-chips.com>
Message-ID: <8e4966d3-c57c-735a-d0e0-ca769c2d4f0e@rock-chips.com>
Date: Tue, 7 Jul 2020 19:44:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200706223009.1200-2-jonas@kwiboo.se>
X-Mailman-Approved-At: Wed, 08 Jul 2020 07:06:31 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Ben Davis <ben.davis@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1NogMjAyMC83LzcgNjozMCwgSm9uYXMgS2FybG1hbiDQtLXAOgoKPiBEUk1fRk9STUFUX05WMjAg
YW5kIERSTV9GT1JNQVRfTlYzMCBmb3JtYXRzIGlzIHRoZSAyeDEgYW5kIG5vbi1zdWJzYW1wbGVk
Cj4gdmFyaWFudCBvZiBOVjE1LCBhIDEwLWJpdCAyLXBsYW5lIFlVViBmb3JtYXQgdGhhdCBoYXMg
bm8gcGFkZGluZyBiZXR3ZWVuCj4gY29tcG9uZW50cy4gSW5zdGVhZCwgbHVtaW5hbmNlIGFuZCBj
aHJvbWluYW5jZSBzYW1wbGVzIGFyZSBncm91cGVkIGludG8gNHMKPiBzbyB0aGF0IGVhY2ggZ3Jv
dXAgaXMgcGFja2VkIGludG8gYW4gaW50ZWdlciBudW1iZXIgb2YgYnl0ZXM6Cj4KPiBZWVlZID0g
VVZVViA9IDQgKiAxMCBiaXRzID0gNDAgYml0cyA9IDUgYnl0ZXMKPgo+IFRoZSAnMjAnIGFuZCAn
MzAnIHN1ZmZpeCByZWZlcnMgdG8gdGhlIG9wdGltdW0gZWZmZWN0aXZlIGJpdHMgcGVyIHBpeGVs
Cj4gd2hpY2ggaXMgYWNoaWV2ZWQgd2hlbiB0aGUgdG90YWwgbnVtYmVyIG9mIGx1bWluYW5jZSBz
YW1wbGVzIGlzIGEgbXVsdGlwbGUKPiBvZiA0Lgo+Cj4gVjI6IEFkZGVkIE5WMzAgZm9ybWF0Cj4K
PiBTaWduZWQtb2ZmLWJ5OiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+Cj4gLS0tCj4g
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jICB8IDggKysrKysrKysKPiAgIGluY2x1ZGUv
dWFwaS9kcm0vZHJtX2ZvdXJjYy5oIHwgMiArKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMKPiBpbmRleCA3MjJjN2ViZTRlODguLjJkYWY4
YTMwNGI1MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYwo+IEBAIC0yNzgsNiArMjc4LDE0IEBAIGNv
bnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKl9fZHJtX2Zvcm1hdF9pbmZvKHUzMiBmb3JtYXQp
Cj4gICAJCSAgLm51bV9wbGFuZXMgPSAyLCAuY2hhcl9wZXJfYmxvY2sgPSB7IDUsIDUsIDAgfSwK
PiAgIAkJICAuYmxvY2tfdyA9IHsgNCwgMiwgMCB9LCAuYmxvY2tfaCA9IHsgMSwgMSwgMCB9LCAu
aHN1YiA9IDIsCj4gICAJCSAgLnZzdWIgPSAyLCAuaXNfeXV2ID0gdHJ1ZSB9LAo+ICsJCXsgLmZv
cm1hdCA9IERSTV9GT1JNQVRfTlYyMCwJCS5kZXB0aCA9IDAsCj4gKwkJICAubnVtX3BsYW5lcyA9
IDIsIC5jaGFyX3Blcl9ibG9jayA9IHsgNSwgNSwgMCB9LAo+ICsJCSAgLmJsb2NrX3cgPSB7IDQs
IDIsIDAgfSwgLmJsb2NrX2ggPSB7IDEsIDEsIDAgfSwgLmhzdWIgPSAyLAo+ICsJCSAgLnZzdWIg
PSAxLCAuaXNfeXV2ID0gdHJ1ZSB9LAo+ICsJCXsgLmZvcm1hdCA9IERSTV9GT1JNQVRfTlYzMCwJ
CS5kZXB0aCA9IDAsCj4gKwkJICAubnVtX3BsYW5lcyA9IDIsIC5jaGFyX3Blcl9ibG9jayA9IHsg
NSwgNSwgMCB9LAo+ICsJCSAgLmJsb2NrX3cgPSB7IDQsIDIsIDAgfSwgLmJsb2NrX2ggPSB7IDEs
IDEsIDAgfSwgLmhzdWIgPSAxLAo+ICsJCSAgLnZzdWIgPSAxLCAuaXNfeXV2ID0gdHJ1ZSB9LAo+
ICAgCQl7IC5mb3JtYXQgPSBEUk1fRk9STUFUX1E0MTAsCQkuZGVwdGggPSAwLAo+ICAgCQkgIC5u
dW1fcGxhbmVzID0gMywgLmNoYXJfcGVyX2Jsb2NrID0geyAyLCAyLCAyIH0sCj4gICAJCSAgLmJs
b2NrX3cgPSB7IDEsIDEsIDEgfSwgLmJsb2NrX2ggPSB7IDEsIDEsIDEgfSwgLmhzdWIgPSAwLAo+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaCBiL2luY2x1ZGUvdWFw
aS9kcm0vZHJtX2ZvdXJjYy5oCj4gaW5kZXggY2JmOTJmZGYyNzEyLi5jODY5NTY3MzI5NWMgMTAw
NjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPiArKysgYi9pbmNsdWRl
L3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+IEBAIC0yNDIsNiArMjQyLDggQEAgZXh0ZXJuICJDIiB7
Cj4gICAgKiBpbmRleCAxID0gQ3I6Q2IgcGxhbmUsIFszOTowXSBDcjE6Q2IxOkNyMDpDYjAgbGl0
dGxlIGVuZGlhbgo+ICAgICovCj4gICAjZGVmaW5lIERSTV9GT1JNQVRfTlYxNQkJZm91cmNjX2Nv
ZGUoJ04nLCAnVicsICcxJywgJzUnKSAvKiAyeDIgc3Vic2FtcGxlZCBDcjpDYiBwbGFuZSAqLwo+
ICsjZGVmaW5lIERSTV9GT1JNQVRfTlYyMAkJZm91cmNjX2NvZGUoJ04nLCAnVicsICcyJywgJzAn
KSAvKiAyeDEgc3Vic2FtcGxlZCBDcjpDYiBwbGFuZSAqLwo+ICsjZGVmaW5lIERSTV9GT1JNQVRf
TlYzMAkJZm91cmNjX2NvZGUoJ04nLCAnVicsICczJywgJzAnKSAvKiBub24tc3Vic2FtcGxlZCBD
cjpDYiBwbGFuZSAqLwo+ICAgCj4gICAvKgo+ICAgICogMiBwbGFuZSBZQ2JDciBNU0IgYWxpZ25l
ZAoKUmV2aWV3ZWQtYnk6IFNhbmR5IEh1YW5nIDxoamNAcm9jay1jaGlwcy5jb20+CgotLSAKQmVz
dCBSZWdhcmQKCrvGvNLuzgpTYW5keSBIdWFuZwpBZGRyOiC4o9bdytC5xMKlx/jNrcXMwrfI7bz+
tPO1wDg5usW4o9bdyO28/tSwQcf4MjG6xcKlKDM1MDAwMykKICAgICAgIE5vLiAyMSBCdWlsZGlu
ZywgQSBEaXN0cmljdCwgTm8uODksc29mdHdhcmUgQm91bGV2YXJkIEZ1emhvdSxGdWppYW4sUFJD
ClRlbKO6Kzg2IDA1OTEtODc4ODQ5MTkgIDg2OTAKRS1tYWlso7poamNAcm9jay1jaGlwcy5jb20K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
