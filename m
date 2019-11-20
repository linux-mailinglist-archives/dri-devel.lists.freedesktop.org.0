Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 276AF103CDB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 15:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68EF6EA3D;
	Wed, 20 Nov 2019 14:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B35A6EA3D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 14:01:35 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20191120140134euoutp02967bb0a53676df32864118bba6a386f7~Y48Jz16-u1746517465euoutp02x
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 14:01:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20191120140134euoutp02967bb0a53676df32864118bba6a386f7~Y48Jz16-u1746517465euoutp02x
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191120140133eucas1p2d776e707b67e02dc328923b7d628ca50~Y48JX6M5Q1046910469eucas1p2a;
 Wed, 20 Nov 2019 14:01:33 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 2E.82.04374.D3745DD5; Wed, 20
 Nov 2019 14:01:33 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20191120140133eucas1p253d10e944e04031d8e1a52fb42dd114a~Y48JBrOOC1428614286eucas1p21;
 Wed, 20 Nov 2019 14:01:33 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191120140133eusmtrp191cdd362b4ccee19339c01f9523cabe2~Y48JA8Ykw1670816708eusmtrp1M;
 Wed, 20 Nov 2019 14:01:33 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-11-5dd5473d36a5
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 9E.FB.04166.D3745DD5; Wed, 20
 Nov 2019 14:01:33 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20191120140132eusmtip1acdb2d3f9957242710494d1770d0dcf8~Y48Il3ISp0041700417eusmtip11;
 Wed, 20 Nov 2019 14:01:32 +0000 (GMT)
Subject: Re: [PATCH] video: Fix Kconfig indentation
To: Krzysztof Kozlowski <krzk@kernel.org>, Daniel Thompson
 <daniel.thompson@linaro.org>, Jiri Kosina <trivial@kernel.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <836ebffa-3074-7c98-c8f1-43227eacdaa1@samsung.com>
Date: Wed, 20 Nov 2019 15:01:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191120135012.GA17348@kozik-lap>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIKsWRmVeSWpSXmKPExsWy7djPc7q27ldjDf5clbc48+Yuu8WVr+/Z
 LFZ8mclucf78BnaL+1+PMlqc6PvAanF51xw2i/f7LzM5cHjsnHWX3WPTqk42jzvX9rB53O8+
 zuTxeZNcAGsUl01Kak5mWWqRvl0CV8a1pm7WguccFa9b9zA3MHazdzFyckgImEg0XPzM0sXI
 xSEksIJR4sGydcwQzhdGiW+X+1ghnM+MEpvaelhgWlZf+MAEkVjOKHFz8w8o5y2jxMWt/xlB
 qoQFjCXO9K0F6xARqJZo+fmGEaSIGaRj4saprCAJNgEriYntq4ASHBy8AnYSs3c6g4RZBFQl
 Nqw4wgxiiwpESHx6cBisnFdAUOLkzCdgMzkF9CUWnZkKZjMLiEvcejKfCcKWl9j+dg7YDxIC
 h9glTlw/DvWpi8TjzW+YIWxhiVfHt0DFZSROT+5hgWhYxyjxt+MFVPd2Ronlk/+xQVRZSxw+
 fpEV5FJmAU2J9bv0IcKOEt/v97KDhCUE+CRuvBWEOIJPYtK26cwQYV6JjjYhiGo1iQ3LNrDB
 rO3auZJ5AqPSLCSvzULyziwk78xC2LuAkWUVo3hqaXFuemqxcV5quV5xYm5xaV66XnJ+7iZG
 YEI6/e/41x2M+/4kHWIU4GBU4uEVULsaK8SaWFZcmXuIUYKDWUmEd8/1K7FCvCmJlVWpRfnx
 RaU5qcWHGKU5WJTEeasZHkQLCaQnlqRmp6YWpBbBZJk4OKUaGMX//1G7xNFy8PfHCykasz0k
 je4lcjpxzHw4sdbqgcb7ha+rbqTrL62cZnsn8M33N1YfjSRFJr7UEi2ddyHzz7rF4ttu1oTa
 Lz555N2TJe+dHfxmPGN+N//SsoATKr2pWdMWXbl1Ibp23m8V5cJbLgYLula4TxPhPv219NNu
 Zf+27JmGHPtqBM2VWIozEg21mIuKEwEF/TBlRAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xu7q27ldjDbas4rY48+Yuu8WVr+/Z
 LFZ8mclucf78BnaL+1+PMlqc6PvAanF51xw2i/f7LzM5cHjsnHWX3WPTqk42jzvX9rB53O8+
 zuTxeZNcAGuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqR
 vl2CXsa1pm7WguccFa9b9zA3MHazdzFyckgImEisvvCBqYuRi0NIYCmjxPWnM1m6GDmAEjIS
 x9eXQdQIS/y51sUGUfOaUWLzn71sIAlhAWOJM31rWUBsEYFaic5JX1hAipgFljNKXP43mx2i
 4wyjRPuEfrAqNgEriYntqxhBNvAK2EnM3ukMEmYRUJXYsOIIM4gtKhAhcXjHLEYQm1dAUOLk
 zCdgrZwC+hKLzkwFs5kF1CX+zLvEDGGLS9x6Mp8JwpaX2P52DvMERqFZSNpnIWmZhaRlFpKW
 BYwsqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQLjb9uxn5t3MF7aGHyIUYCDUYmHV0DtaqwQ
 a2JZcWXuIUYJDmYlEd4916/ECvGmJFZWpRblxxeV5qQWH2I0BXpuIrOUaHI+MDXklcQbmhqa
 W1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+LglGpgVL2T8NZ0+kHZ2UeUFl3qun/0
 cv+L7bNYl+Wm3q8vf3VvlvS/3XNV58XsZl/Wc8ZzyVWbwOdmKcF3BIps3lRyXjvHLX3ggXRX
 g0riFqtm7VSm2Ydrcoz37ZXn8Vpnp7ApwPpMSbKutuWSNuPIrCN7FkUGrhHffnvPt5j8CI1j
 P97XLg8+l7MrQomlOCPRUIu5qDgRADeAJjXVAgAA
X-CMS-MailID: 20191120140133eucas1p253d10e944e04031d8e1a52fb42dd114a
X-Msg-Generator: CA
X-RootMTR: 20191120135021eucas1p206063d872dc96d25d0f10fc99ab41124
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191120135021eucas1p206063d872dc96d25d0f10fc99ab41124
References: <20191120133838.13132-1-krzk@kernel.org>
 <20191120134546.GA2654@pine>
 <CGME20191120135021eucas1p206063d872dc96d25d0f10fc99ab41124@eucas1p2.samsung.com>
 <20191120135012.GA17348@kozik-lap>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1574258494;
 bh=YoxJZPhSqKCy/ocofK80QmJ9H9riVpzQRCC94UudwZE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=c42UZB7d66hIuXBLEYhqKGIi5NEc7KTf9yuRCF+t5uXPkUjuCleQU7NfA8bcbB4PX
 H81ATbpCirfuct8aSqnsGef92UDtomJOSTJzuyLPAmYZ+Fzeol0sT+S9TcykHBNv1I
 /9lp/56onNOpnwIPA3sgEYO4nYPuchKraXdgvvi4=
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
Cc: Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClsgYWRkZWQgSmlyaSB0byBDYzogXQoKT24gMTEvMjAvMTkgMjo1MCBQTSwgS3J6eXN6dG9mIEtv
emxvd3NraSB3cm90ZToKPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAwODo0NTo0NkFNIC0wNTAw
LCBEYW5pZWwgVGhvbXBzb24gd3JvdGU6Cj4+IE9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDA5OjM4
OjM4UE0gKzA4MDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+PiBBZGp1c3QgaW5kZW50
YXRpb24gZnJvbSBzcGFjZXMgdG8gdGFiICgrb3B0aW9uYWwgdHdvIHNwYWNlcykgYXMgaW4KPj4+
IGNvZGluZyBzdHlsZSB3aXRoIGNvbW1hbmQgbGlrZToKPj4+IAkkIHNlZCAtZSAncy9eICAgICAg
ICAvXHQvJyAtaSAqL0tjb25maWcKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296
bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4+Cj4+IE5vIHBhcnRpY3VsYXIgb2JqZWN0aW9ucyBi
dXQgSSB3b25kZXIgaWYgdGhpcyB3b3VsZCBiZSBiZXR0ZXIgc2VudCB0bwo+PiB0cml2aWFsQGtl
cm5lbC5vcmcgLgo+IAo+IFRoYW5rcyBmb3IgZmVlZGJhY2suCj4gCj4gSSBzZW50IHRvIHRyaXZp
YWwgYW5kIGtlcm5lbC1qYW5pdG9ycyBteSBwcmV2aW91cyB2ZXJzaW9uIG9mIHRoaXMKPiBwYXRj
aHNldCB3aGljaCB3YXMgbm90IHNwbGl0IHBlci1zdWJzeXN0ZW0gYW5kIHRoZXJlIHdhcyBubyBm
ZWVkYmFjay4KPiBGZXcgb3RoZXIgcGF0Y2hlcyBhbHJlYWR5IGNhbWUgdGhyb3VnaCBtYWludGFp
bmVycy4gSWYgdGhlcmUgd2lsbCBiZSBubwo+IHJlcGx5LCBJJ2xsIHNlbmQgbmV4dCB2ZXJzaW9u
IHRocm91Z2ggdHJpdmlhbC4KCklmIGFueW9uZSB3YW50cyB0byBtZXJnZSBpdCB0aHJvdWdoIGJh
Y2tsaWdodCBvciB0cml2aWFsIHRyZWU6CgpBY2tlZC1ieTogQmFydGxvbWllaiBab2xuaWVya2ll
d2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgoKT3RoZXJ3aXNlIEknbGwgcXVldWUgdGhp
cyB0aHJvdWdoIGRybS1taXNjIHRyZWUgZm9yIHY1LjYuCgpCZXN0IHJlZ2FyZHMsCi0tCkJhcnRs
b21pZWogWm9sbmllcmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5n
IEVsZWN0cm9uaWNzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
