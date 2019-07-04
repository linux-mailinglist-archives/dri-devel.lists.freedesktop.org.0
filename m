Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 003F85F812
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 14:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEE36E332;
	Thu,  4 Jul 2019 12:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1FC6E332
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 12:26:35 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190704122633euoutp02c2cac6286a424212f95db9e8a249786c~uM_hbs_Nl1278112781euoutp02K
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 12:26:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190704122633euoutp02c2cac6286a424212f95db9e8a249786c~uM_hbs_Nl1278112781euoutp02K
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190704122632eucas1p2e95de9aba9a91739d1e0a83558669ded~uM_gkg6F91869518695eucas1p2a;
 Thu,  4 Jul 2019 12:26:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 2B.E2.04325.870FD1D5; Thu,  4
 Jul 2019 13:26:32 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190704122631eucas1p1ba141e3585757f1a5804ebf941f439a8~uM_fsCbJJ3031230312eucas1p1y;
 Thu,  4 Jul 2019 12:26:31 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190704122631eusmtrp1326547f44e3ec4d8a7d7a822a9b9ef48~uM_fd8RNs0872508725eusmtrp1_;
 Thu,  4 Jul 2019 12:26:31 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-8e-5d1df078fbb6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B8.FF.04140.770FD1D5; Thu,  4
 Jul 2019 13:26:31 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190704122631eusmtip2586506a3e54d779106da6aa7f906f1dd~uM_fDY3xu0709207092eusmtip2w;
 Thu,  4 Jul 2019 12:26:31 +0000 (GMT)
Subject: Re: [PATCH 1/3] drm/bridge: ti-sn65dsi86: add link to datasheet
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <2089b5bc-44bf-1dad-3e3d-08eff409335f@samsung.com>
Date: Thu, 4 Jul 2019 14:26:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190702154419.20812-2-robdclark@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNKsWRmVeSWpSXmKPExsWy7djPc7oVH2RjDR4+U7ToPXeSyeL/tonM
 Fle+vmez6Jy4hN1i4v6z7BaXd81hs7j28zGzxfOFP5gt7m44y+jA6TG74SKLx95vC1g8ds66
 y+4xu2Mmq8f2bw9YPe53H2fy+LxJLoA9issmJTUnsyy1SN8ugSvjxmq7gvdsFZOPH2ZsYLzE
 2sXIwSEhYCJx/XdZFyMXh5DACkaJhTdmsUE4Xxglvp6bxdLFyAnkfGaUWLu3FMQGadh49ChU
 fDmjRP/BQoiGt4wSJ2YvZQNJCAt4SPy4sx3MFhFwkThx6TcriM0s0MIksXFrLYjNJqAp8Xfz
 TbAaXgE7ieUbvoDVsAioSGxYcBLMFhWIkLi8ZRcjRI2gxMmZT8AWcwpYSnx5uRBqprxE89bZ
 zBC2uMStJ/OZQA6SEDjFLjF/0QpmiKtdJOZPe84OYQtLvDq+BcqWkTg9uYcFwq6XuL+ihRmi
 uYNRYuuGnVDN1hKHj18Ehxcz0NXrd+lDhB0lvq2dzQQJRj6JG28FIW7gk5i0bTozRJhXoqNN
 CKJaUeL+2a1QA8Ulll74yjaBUWkWks9mIflmFpJvZiHsXcDIsopRPLW0ODc9tdg4L7Vcrzgx
 t7g0L10vOT93EyMwSZ3+d/zrDsZ9f5IOMQpwMCrx8D7YIhMrxJpYVlyZe4hRgoNZSYT3+2+g
 EG9KYmVValF+fFFpTmrxIUZpDhYlcd5qhgfRQgLpiSWp2ampBalFMFkmDk6pBkYT7d5P7WrW
 CutZzM60ezLt3BH401b8Qt5zR8mVCq8t6p5Erikx1pgh0WTJGDar8/6bzBX2XdY3uWOby45p
 RDo2pPEV3djzev3sWTZLz7j9F5uhLXMr7YG244Oarg7NCN2D1bqmm7iKz7+LS0/dYNYVeuKA
 1Mri6edv362Uynx3aI2gSmXgViWW4oxEQy3mouJEAMreMVROAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRmVeSWpSXmKPExsVy+t/xe7rlH2RjDeY8UrfoPXeSyeL/tonM
 Fle+vmez6Jy4hN1i4v6z7BaXd81hs7j28zGzxfOFP5gt7m44y+jA6TG74SKLx95vC1g8ds66
 y+4xu2Mmq8f2bw9YPe53H2fy+LxJLoA9Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DY
 PNbKyFRJ384mJTUnsyy1SN8uQS/jxmq7gvdsFZOPH2ZsYLzE2sXIySEhYCKx8ehRFhBbSGAp
 o8TkS+YQcXGJ3fPfMkPYwhJ/rnWxdTFyAdW8ZpT48OkFWIOwgIfEjzvb2UBsEQEXiROXfrOC
 FDELtDFJXNzbxgrRsZtRYm7jVSaQKjYBTYm/m2+CdfAK2Eks3/AF7AwWARWJDQtOgtmiAhES
 fW2zoWoEJU7OfAK2jVPAUuLLy4VgNcwC6hJ/5l1ihrDlJZq3zoayxSVuPZnPNIFRaBaS9llI
 WmYhaZmFpGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwOjcduznlh2MXe+CDzEKcDAq
 8fA+2CITK8SaWFZcmXuIUYKDWUmE9/tvoBBvSmJlVWpRfnxRaU5q8SFGU6DnJjJLiSbnAxNH
 Xkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGRo8tnu3CVdpT1k/e
 9Wayde/sg+aXDATKLf/2qR+8o1L87d06q2leQSEM6/T2tjOJe7md89m+y6c8yFq9J9P7+Jn/
 755/Fbp5/k4ek8LBMzsqQrky/UwnpF527ylp0lvGEvlg96rt1Zeb+S8eMhBX5rC+4HKg2ULs
 EUfz4Z431/h7Eyb++r+lRYmlOCPRUIu5qDgRAHLmH1fkAgAA
X-CMS-MailID: 20190704122631eucas1p1ba141e3585757f1a5804ebf941f439a8
X-Msg-Generator: CA
X-RootMTR: 20190702154438epcas1p2493f1bde0f16a5bdd63f884826e2071c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190702154438epcas1p2493f1bde0f16a5bdd63f884826e2071c
References: <20190702154419.20812-1-robdclark@gmail.com>
 <CGME20190702154438epcas1p2493f1bde0f16a5bdd63f884826e2071c@epcas1p2.samsung.com>
 <20190702154419.20812-2-robdclark@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1562243193;
 bh=3MtEWWvx6gqwDixQ5dHpVZg1D4dhpVO9nckP3J732x0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=iMSGc6pyR3y9zEdc6Mh5Bj1w+702dF1gurD3Ox8+0V09j+tK8EwV3l2gBFrzTRBCa
 sFgRhSB/7dAeihBWLSvZH5077BxWfuXSLqbOgDzgB66u0yTrHZcKJFl1hDprMer2pj
 Q04WiQ63oKhqCnXgKRSDSGFRF+AdwSvmoUJJtp2k=
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDIuMDcuMjAxOSAxNzo0NCwgUm9iIENsYXJrIHdyb3RlOgo+IEZyb206IFJvYiBDbGFyayA8
cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPgo+IFRoZSBicmlkZ2UgaGFzIHByZXR0eSBnb29kIGRv
Y3MsIGxldHMgYWRkIGEgbGluayB0byBtYWtlIHRoZW0gZWFzaWVyIHRvCj4gZmluZC4KPgo+IFNp
Z25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KCgpSZXZpZXdl
ZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KCsKgLS0KUmVnYXJkcwpB
bmRyemVqCgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYyB8
IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90aS1zbjY1ZHNpODYuYwo+IGluZGV4IGJjY2E5MTczYzcyYS4uZjFhMjQ5M2I4NmQ5IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCj4gQEAgLTEsNiArMSw3IEBA
Cj4gIC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gIC8qCj4gICAqIENvcHly
aWdodCAoYykgMjAxOCwgVGhlIExpbnV4IEZvdW5kYXRpb24uIEFsbCByaWdodHMgcmVzZXJ2ZWQu
Cj4gKyAqIGRhdGFzaGVldDogaHR0cDovL3d3dy50aS5jb20vbGl0L2RzL3N5bWxpbmsvc242NWRz
aTg2LnBkZgo+ICAgKi8KPiAgCj4gICNpbmNsdWRlIDxsaW51eC9jbGsuaD4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
