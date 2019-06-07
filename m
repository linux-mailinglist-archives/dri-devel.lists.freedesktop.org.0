Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922E0387A4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 12:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7A289956;
	Fri,  7 Jun 2019 10:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C0BF589956
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 10:05:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A49A3EF;
 Fri,  7 Jun 2019 03:05:39 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A84B73F96A;
 Fri,  7 Jun 2019 03:07:19 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 0D870682579; Fri,  7 Jun 2019 11:05:38 +0100 (BST)
Date: Fri, 7 Jun 2019 11:05:38 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH 3/4] drm: Increase DRM_OBJECT_MAX_PROPERTY to 32
Message-ID: <20190607100537.GC4173@e110455-lin.cambridge.arm.com>
References: <20190521093411.26609-1-james.qian.wang@arm.com>
 <20190521093411.26609-4-james.qian.wang@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521093411.26609-4-james.qian.wang@arm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "Oscar Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "ezequiel@collabora.com" <ezequiel@collabora.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "uma.shankar@intel.com" <uma.shankar@intel.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMTA6MzQ6NTRBTSArMDEwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gRFJNX09CSkVDVF9NQVhfUFJPUEVSVFkg
bnVtYmVyIDI0IGlzIG5vdCBlbm91Z2ggZm9yIGtvbWVkYSB1c2FnZSwgaW5jcmVhc2UKPiBpdCB0
byAzMiB0byBmaXQga29tZWRhJ3MgcmVxdWlyZW1lbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFt
ZXMgUWlhbiBXYW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0u
Y29tPgoKUmV2aWV3ZWQtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgoKQmVz
dCByZWdhcmRzLApMaXZpdQoKPiAtLS0KPiAgaW5jbHVkZS9kcm0vZHJtX21vZGVfb2JqZWN0Lmgg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fbW9kZV9vYmplY3QuaCBiL2luY2x1ZGUv
ZHJtL2RybV9tb2RlX29iamVjdC5oCj4gaW5kZXggYzM0YTNlODAzMGUxLi5mZDc2NjYwNDgxOTcg
MTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21vZGVfb2JqZWN0LmgKPiArKysgYi9pbmNs
dWRlL2RybS9kcm1fbW9kZV9vYmplY3QuaAo+IEBAIC02MCw3ICs2MCw3IEBAIHN0cnVjdCBkcm1f
bW9kZV9vYmplY3Qgewo+ICAJdm9pZCAoKmZyZWVfY2IpKHN0cnVjdCBrcmVmICprcmVmKTsKPiAg
fTsKPiAKPiAtI2RlZmluZSBEUk1fT0JKRUNUX01BWF9QUk9QRVJUWSAyNAo+ICsjZGVmaW5lIERS
TV9PQkpFQ1RfTUFYX1BST1BFUlRZIDMyCj4gIC8qKgo+ICAgKiBzdHJ1Y3QgZHJtX29iamVjdF9w
cm9wZXJ0aWVzIC0gcHJvcGVydHkgdHJhY2tpbmcgZm9yICZkcm1fbW9kZV9vYmplY3QKPiAgICov
Cj4gLS0KPiAyLjE3LjEKCi0tIAo9PT09PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0
byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0
aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4Qp
Xy/CrwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
