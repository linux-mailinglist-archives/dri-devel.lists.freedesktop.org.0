Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F7638A6A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 14:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBBA89E01;
	Fri,  7 Jun 2019 12:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5ACF89E01
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:34:18 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607123417euoutp01b82541a67403852a9e531767318fa0e2~l6qkRNjwi0283802838euoutp01x
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:34:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190607123417euoutp01b82541a67403852a9e531767318fa0e2~l6qkRNjwi0283802838euoutp01x
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190607123417eucas1p1579ac77f6dab482898a969b95f3dbdfe~l6qj77LNs0536405364eucas1p1g;
 Fri,  7 Jun 2019 12:34:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 4F.D5.04298.8C95AFC5; Fri,  7
 Jun 2019 13:34:17 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190607123416eucas1p26b0c4a07ba6e0df82b1eda761a0f1826~l6qjGVbCk2754527545eucas1p2q;
 Fri,  7 Jun 2019 12:34:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190607123416eusmtrp27950baecf5100ddb99a2a527e05e1aff~l6qi21qGO1092410924eusmtrp2W;
 Fri,  7 Jun 2019 12:34:16 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-76-5cfa59c89800
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D4.13.04140.8C95AFC5; Fri,  7
 Jun 2019 13:34:16 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190607123416eusmtip2486eea84d94d6a978bbe2134d9f1f9d0~l6qiohWtd2452524525eusmtip2A;
 Fri,  7 Jun 2019 12:34:16 +0000 (GMT)
Subject: Re: [PATCH 1/2] video: fbdev: pvr2fb: remove function prototypes
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <48846eb7-efdc-b26e-d331-d3ad1d8dbea4@samsung.com>
Date: Fri, 7 Jun 2019 14:34:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2a32648a-69c8-47a6-109a-6c2f764b2534@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnleLIzCtJLcpLzFFi42LZduzned2Tkb9iDCbNYLS48vU9m8WJvg+s
 Fpd3zWFzYPa4332cyePzJrkApigum5TUnMyy1CJ9uwSujL29qgVXmCr6zv5jb2CcwdTFyMkh
 IWAiMevbYcYuRi4OIYEVjBJP57xhg3C+MEqcPr+GDaRKSOAzo8SB1SIwHccvX4AqWs4ocfva
 J6j2t4wSsy+eBusQFvCUeLPzACuIzSZgJTGxfRUjiC0ikCCxYvoMMJtXwE5i1qwJYDUsAioS
 D3pnsYDYogIREvePbWCFqBGUODnzCVicU8BeYt3TxcwgNrOAuMStJ/OZIGx5ie1v5zCDHCEh
 8J5N4sOVCcwQp7pIzNo6kxXCFpZ4dXwLO4QtI/F/J0gzSMM6Rom/HS+gurczSiyf/I8Nospa
 4vDxi0DdHEArNCXW79KHCDtK/Fv1jgkkLCHAJ3HjrSDEEXwSk7ZNZ4YI80p0tAlBVKtJbFi2
 gQ1mbdfOlVCneUg8f7yXaQKj4iwkb85C8tosJK/NQrhhASPLKkbx1NLi3PTUYsO81HK94sTc
 4tK8dL3k/NxNjMDkcfrf8U87GL9eSjrEKMDBqMTD68H+M0aINbGsuDL3EKMEB7OSCG/ZhR8x
 QrwpiZVVqUX58UWlOanFhxilOViUxHmrGR5ECwmkJ5akZqemFqQWwWSZODilGhij+RtC9t+Y
 +Mag49gP04WfLbV0FQyTAyMVfSYeubNmju3u04lsyhl6pVlxKr7zRIsn9pVH3720MeZP+vka
 ln1qbO4mtXaHX66auChbyG6z8XWO01M2ZFs9mHmb22rpPP+I035SNSyCgkFJc0/se7cp7YPH
 xRJB2R/fHl3n2TRP/HZPZk1LR6USS3FGoqEWc1FxIgC0EyYHGgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeLIzCtJLcpLzFFi42I5/e/4Pd0Tkb9iDB4u4be48vU9m8WJvg+s
 Fpd3zWFzYPa4332cyePzJrkApig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNT
 JX07m5TUnMyy1CJ9uwS9jL29qgVXmCr6zv5jb2CcwdTFyMkhIWAicfzyBbYuRi4OIYGljBIb
 lk5m7GLkAErISBxfXwZRIyzx51oXVM1rRon9G5eygiSEBTwl3uw8AGazCVhJTGxfxQhiiwgk
 SDx9PZ8NxBYSsJP4uPABmM0LZM+aNQGsnkVAReJB7ywWEFtUIELizPsVLBA1ghInZz4BszkF
 7CXWPV3MDGIzC6hL/Jl3CcoWl7j1ZD4ThC0vsf3tHOYJjIKzkLTPQtIyC0nLLCQtCxhZVjGK
 pJYW56bnFhvpFSfmFpfmpesl5+duYgTGxLZjP7fsYOx6F3yIUYCDUYmHdwbTzxgh1sSy4src
 Q4wSHMxKIrxlF37ECPGmJFZWpRblxxeV5qQWH2I0BXpuIrOUaHI+MF7zSuINTQ3NLSwNzY3N
 jc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUwnrmppBqf8+dy9oS1tdymBT9tfPjuTXx0
 8YTrjFO+Iqkx9YqCr7Tlsnda75tcnBHVyS7UXzF3c8RctkkbQi+odty3a8xPu6rzWvBk9fpz
 huVubQ13maMOmZkvei34au4hoYsFYnnOelJr7mao204LPpO9VPBKBRtXWPfXfRNb+hM1qudX
 bNmuxFKckWioxVxUnAgAKyLG+J8CAAA=
X-CMS-MailID: 20190607123416eucas1p26b0c4a07ba6e0df82b1eda761a0f1826
X-Msg-Generator: CA
X-RootMTR: 20190607123416eucas1p26b0c4a07ba6e0df82b1eda761a0f1826
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607123416eucas1p26b0c4a07ba6e0df82b1eda761a0f1826
References: <2a32648a-69c8-47a6-109a-6c2f764b2534@samsung.com>
 <CGME20190607123416eucas1p26b0c4a07ba6e0df82b1eda761a0f1826@eucas1p2.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559910857;
 bh=C9zZYL4Oupw/s/ug0pe1BkeLpxedG0UIeuMqKs7Ti7o=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=ZTOKJShHElhACzIrbF+5cn1usNRy9gq/7Pqzqd/zq3DLqLLr2l3mCljLadeJyNPeo
 XC38DpMX4EaJF3dFGBBXWB1VyPDF6pGQrOx2igjkh229UcWBr8ncRur6M7FWfFL6BQ
 cUWdsJBm0n2gGgj/W2ky37QYYdA4Iy73t01r1nVQ=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDUvMjIvMTkgMTI6MTUgUE0sIEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogd3JvdGU6Cj4g
UmVvcmRlciBjb2RlIGEgYml0IGFuZCB0aGVuIHJlbW92ZSBubyBsb25nZXIgbmVlZGVkIGZ1bmN0
aW9uCj4gcHJvdG90eXBlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0bG9taWVqIFpvbG5pZXJr
aWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+CgpJIHF1ZXVlZCB0aGUgcGF0Y2ggZm9y
IHY1LjMuCgpCZXN0IHJlZ2FyZHMsCi0tCkJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oKU2Ftc3Vu
ZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5nIEVsZWN0cm9uaWNzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
