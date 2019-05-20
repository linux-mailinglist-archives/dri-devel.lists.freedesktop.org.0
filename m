Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2B722DA5
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 10:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19E9891F2;
	Mon, 20 May 2019 08:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC23891F2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 08:05:23 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190520080521euoutp02c1c4cfb1cc0df6f38c91fc734e61d623~gVYnU7wsw0735507355euoutp02T
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 08:05:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190520080521euoutp02c1c4cfb1cc0df6f38c91fc734e61d623~gVYnU7wsw0735507355euoutp02T
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190520080520eucas1p11d8bfb238865f0d54f1d8911fb03a991~gVYmz07Oq2609826098eucas1p1M;
 Mon, 20 May 2019 08:05:20 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 33.0F.04325.0CF52EC5; Mon, 20
 May 2019 09:05:20 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190520080520eucas1p10a60f58f21cf785ffe449c213daecdc1~gVYmCBIlQ2358323583eucas1p1Z;
 Mon, 20 May 2019 08:05:20 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190520080520eusmtrp2f5847286dfd832358321f43a292a3299~gVYmBcNjX0781107811eusmtrp2r;
 Mon, 20 May 2019 08:05:20 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-e5-5ce25fc08206
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D3.15.04140.0CF52EC5; Mon, 20
 May 2019 09:05:20 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190520080519eusmtip238cfac07af457a6f10ed1f969256f4bb~gVYlq8eCV1233512335eusmtip2W;
 Mon, 20 May 2019 08:05:19 +0000 (GMT)
Subject: Re: [PATCH v2] drm/bridge: Remove duplicate header
To: Sabyasachi Gupta <sabyasachi.linux@gmail.com>, architt@codeaurora.org,
 Laurent.pinchart@ideasonboard.com, airlied@linux.ie
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <4e46d26e-675c-23db-5b5d-5030f64cda56@samsung.com>
Date: Mon, 20 May 2019 10:05:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5cdd8109.1c69fb81.6e003.b84b@mx.google.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIKsWRmVeSWpSXmKPExsWy7djP87oH4h/FGOy9pW7Re+4kk0VTx1tW
 iytf37NZXLvawGzROXEJu8XlXXPYLC59PMTkwO5xua+XyWPnrLvsHrM7ZrJ6bP/2gNXjfvdx
 Jo/Pm+QC2KK4bFJSczLLUov07RK4Mo53P2cu+M9ecWjxRrYGxlNsXYycHBICJhLbu5exdjFy
 cQgJrGCUeD+tgQnC+cIo8e3ya3YI5zOjxOzJb9lhWrp/NUNVLWeUWN79mRHCecsocWHmfVaQ
 KmEBa4m2zuVg7SICDYwSt7bfB9vILBApMffOAkYQm01AU+Lv5ptgcV4BO4meTfPAVrAIqErM
 vj8TzBYViJC4f2wDK0SNoMTJmU9YQGxOAUuJZT0bGCFmyktsfzuHGcIWl7j1ZD7YeRIC29gl
 2k9tY4K420Vi1foHrBC2sMSr41ug/pGR+L9zPlRNvcT9FS3MEM0djBJbN+xkhkhYSxw+fhGo
 mQNog6bE+l36EGFHiQOnnzGBhCUE+CRuvBWEuIFPYtK26cwQYV6JjjYhiGpFiftnt0INFJdY
 euEr2wRGpVlIPpuF5JtZSL6ZhbB3ASPLKkbx1NLi3PTUYuO81HK94sTc4tK8dL3k/NxNjMCE
 dPrf8a87GPf9STrEKMDBqMTD6zH9YYwQa2JZcWXuIUYJDmYlEV5j9fsxQrwpiZVVqUX58UWl
 OanFhxilOViUxHmrGR5ECwmkJ5akZqemFqQWwWSZODilGhg17k2Uv+2Y84Mr+52r4Hd+uUON
 QesO/+gJ4rOydHExDZb4yqXhxy1tr6NxtVJrXc+0FOusi2wPcsL35ipt1fm9IDpwp8PaOyYz
 v1uf3HJP2XvmLRXNKcEn1GXP/FWMqJJMLkoXYHU74uzuw/bx8xXf6qTktL0Sc7dxTz18VOX3
 FbkNVd4/GJVYijMSDbWYi4oTAVyVth5EAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRmVeSWpSXmKPExsVy+t/xe7oH4h/FGDx+yGrRe+4kk0VTx1tW
 iytf37NZXLvawGzROXEJu8XlXXPYLC59PMTkwO5xua+XyWPnrLvsHrM7ZrJ6bP/2gNXjfvdx
 Jo/Pm+QC2KL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov0
 7RL0Mo53P2cu+M9ecWjxRrYGxlNsXYycHBICJhLdv5qZuhi5OIQEljJKfJp3lhEiIS6xe/5b
 ZghbWOLPtS6wBiGB14wSf5fGgNjCAtYSbZ3L2UGaRQQaGCUabk8Bcjg4mAUiJd6fYYeo72GU
 OHQvDMRmE9CU+Lv5JtgcXgE7iZ5N88BqWARUJWbfnwlmiwpESJx5v4IFokZQ4uTMJ2A2p4Cl
 xLKeDWC3MQuoS/yZd4kZwpaX2P52DpQtLnHryXymCYxCs5C0z0LSMgtJyywkLQsYWVYxiqSW
 Fuem5xYb6RUn5haX5qXrJefnbmIERt+2Yz+37GDsehd8iFGAg1GJh/fDlIcxQqyJZcWVuYcY
 JTiYlUR4jdXvxwjxpiRWVqUW5ccXleakFh9iNAV6biKzlGhyPjAx5JXEG5oamltYGpobmxub
 WSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYNS82SXQm/AhtK131cZ7Wqkbrj+Xf+5XN6Gu
 WPUAX+a2X4uanoY7ngvrNPI8LmMMTDSvov7nRdwPvJ59SWzPPYveSerRueZOByZK98fGuem3
 bZmpsW/Jz9pbG2YbKOwI+590VCf2SfORO3Yf1ouYe+2TlnY4eeqQ28r5eQc2GZ79+fWlb+XN
 RUosxRmJhlrMRcWJAJkXpBLUAgAA
X-CMS-MailID: 20190520080520eucas1p10a60f58f21cf785ffe449c213daecdc1
X-Msg-Generator: CA
X-RootMTR: 20190516152606epcas1p153959c396cb312da9ecc0e164bfcc8d3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190516152606epcas1p153959c396cb312da9ecc0e164bfcc8d3
References: <CGME20190516152606epcas1p153959c396cb312da9ecc0e164bfcc8d3@epcas1p1.samsung.com>
 <5cdd8109.1c69fb81.6e003.b84b@mx.google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1558339521;
 bh=kbyN3TjyDx8oqa74b4izYV9eIuvgOoK3g1XdrHecRGY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=LzcDMs6EFgsJFBQrpFGrsqvuvQV9EGN9FB+89CGeQiwRNuM980dA39XU1H+SbQDst
 QG17gEesI5PDlt68tzkQD8+fcCIiU3JapL8lDsLt7V7PJeU6gpSafKT6QbcK4yGVRu
 iMpCHqzuV5nSOV7fj9NQMmHfLbONiviRN5qkkj68=
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
Cc: jrdr.linux@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTYuMDUuMjAxOSAxNzoyNSwgU2FieWFzYWNoaSBHdXB0YSB3cm90ZToKPiBSZW1vdmUgZHVw
bGljYXRlIGhlYWRlciB3aGljaCBpcyBpbmNsdWRlZCB0d2ljZQo+Cj4gU2lnbmVkLW9mZi1ieTog
U2FieWFzYWNoaSBHdXB0YSA8c2FieWFzYWNoaS5saW51eEBnbWFpbC5jb20+CgoKUXVldWVkIHRv
IGRybS1taXNjLW5leHQuCgoKUmVnYXJkcwoKQW5kcnplagoKCj4gLS0tCj4gdjI6IHJlYmFzZWQg
dGhlIGNvZGUgYWdhaW5zdCBkcm0gLW5leHQgYW5kIGFycmFuZ2VkIHRoZSBoZWFkZXJzIGFscGhh
YmV0aWNhbGx5Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jIHwgMyArLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvcGFuZWwuYwo+IGluZGV4IDM4ZWVhZjguLjAwMGJhN2MgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9wYW5lbC5jCj4gQEAgLTksMTMgKzksMTIgQEAKPiAgICovCj4gIAo+ICAjaW5jbHVkZSA8ZHJt
L2RybVAuaD4KPiAtI2luY2x1ZGUgPGRybS9kcm1fcGFuZWwuaD4KPiAgI2luY2x1ZGUgPGRybS9k
cm1fYXRvbWljX2hlbHBlci5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9jb25uZWN0b3IuaD4KPiAg
I2luY2x1ZGUgPGRybS9kcm1fZW5jb2Rlci5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9tb2Rlc2V0
X2hlbHBlcl92dGFibGVzLmg+Cj4gLSNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgo+
ICAjaW5jbHVkZSA8ZHJtL2RybV9wYW5lbC5oPgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9o
ZWxwZXIuaD4KPiAgCj4gIHN0cnVjdCBwYW5lbF9icmlkZ2Ugewo+ICAJc3RydWN0IGRybV9icmlk
Z2UgYnJpZGdlOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
