Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 083DFCB533
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940956EAB8;
	Fri,  4 Oct 2019 07:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5790B6E218
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 15:39:00 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([109.90.233.87]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4hvb-1i6RN120Od-011loW; Wed, 02
 Oct 2019 17:38:48 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/mcde: Fix reference to DOC comment
Date: Wed,  2 Oct 2019 17:38:26 +0200
Message-Id: <20191002153827.23026-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:SVSunW34OIe4oEVA5808fwuyxjOn+4LwN+7F3SKvA2tXwrxZ4Hf
 sXxKuyLBXu20zT684c5xM3xYP6buM+1XcJdQARxKi0O+Qytp/nI6EAd4ZgYmj81/3TLPC0R
 k3NZYHtLRqlmKP13YfBJ8I4gGX0IlC4elWUNLjUMAOHIxuv+0B0aAbri/+0lGfTK0OQ51fu
 B0AjU17XJkcVMotb4r2Pg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3el9ghxLDL4=:UcbCjmWj4WraLgSfYL5TUF
 Pk7ndKlh01nUM8aE3vYwVsz+uszqjobrKK8qe4UcF3J9v9T6yHxc9nhwDf5XPWGHO6NDyUZPH
 aa+53iLudgA5eee8pZ5MaVFO9ss/70BRV5dHHmUCHyCLhb0d6xfavSfkb/Ctut6GaEmYvEtSz
 VwDRL0leZlci/p0Z1F2S8xio1QERlnWedllMLvNMY1lE7S2lsey/Lb6jmAHKvDFhkXp2Gdfqp
 toEIgZMxmxVD4IUXVYV5H2kViDQcRCrUxwnkhPRBF2LCI2PSiq9dI2Fd/YerBIy0Bm0Vmd4dY
 75brhPkyITGoqUTjwxPftnitlWWyeYuS7nH3QPWchDIgQI88lEzG+2h4Xno/fIel8cb4IYvi3
 pWNa47tePmuYPXT5uFL7xyMVEDriAC7CvukZnYS3q6MmY7gWS6PTf2zUcN3A9SnF71gqwcPVB
 kz6qTgZgV2ZT2bGsu4hvgfCSFUYZU1hoEjAgziseu5iInIqCUs/CBvMyyLnShVftcG846gD7l
 Y2hjzcojN/VHj9isHHhXfZoPibDqMukghJqzv9H0Fx1HesEpk9uu3gIyVwyFE0Nt/h/zouKNi
 npRIr2cZ03MLSBphfNyFp3R9OiboRovfpc3gHJHGjtcFpgtag2o5A2lo2qpF1d2SAqasEichf
 KL/lD8vwqJybY7spv/VsYCnGdRjGkVZTgmxeF/X0RAAuZKMA1TpkphI0veE1sE87AitiicqN9
 237UZ/7Qt6/LGqdJPspaoH7hs8/4XF42yk0FoxuD5d5mpS10//UsFv43Zk2OAR0FmUp58pqFf
 kQBpjeE6QlBVS3RaN5/Oy4XojOvwcg2mPIeR04CiwfAZEOSYk7kL8iQ0skit6N7yhgwpOvSJa
 rWXCTvxDdcLd4JBcYWOKR/5pU+Wlzh5QUaRTOqGC8CTh2tlV7Pr7gua9b9oa4K94d3fzzdvGL
 MgrzhUVneX/BOnP486dsKC7S5Joa46apHh8+d5G4bTLvxNB941WeDFLuz75CfZbAZ7s/jnFGX
 q1Zb6kzbTnChvXKA4s9UNojCfw1W+rhSn5aeYVqdXLv+eelP2Rh/l4W41dauVf0nu/HoJdtbh
 +PymWVbJsR0Hdn63k7Aeoan+v0MTc57r5X35uIg/KhtmcaE6DcpxImMd9xETtjVuHiBTvPLLm
 vhfk9g22PDZne8ISXgEG+hs9RO/bJfO5iC/uhf/f3DDzNwggxEnJijM/SLCc/i8iIlLbqPs1Z
 vVH2v9j6cT1m3xfUDBlEYVvOPbvxEtlBwOWubr6r8nBLGYCOvU82DkNw7sJQ=
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1570030728;
 bh=uJ94hoeDYVlEUYDK9HmHZapgsgfzPQRJy+izURTskdE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=WMUwOlX1Lb+j1C/oVgGjmbT2uNZ8Szam2fkpKo78AKGmKzBXzAHYANDh2eDKXx3L4
 wDojROI8kNSvHNtmUonTmzCkOCa3ndhwdVJPJdjX/j1l436Id1m9J11tdGoHeGnkJ/
 V65KyvV+61xIAbki28wFcMSBrP35Y5Gw6qVlXdYQ=
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIDpkb2M6IHJlZmVyZW5jZSBkaWQgbm90IG1hdGNoIHRoZSBET0MgY29tbWVudCdzIG5hbWUu
CgpGaXhlczogNWZjNTM3YmZkMDAwICgiZHJtL21jZGU6IEFkZCBuZXcgZHJpdmVyIGZvciBTVC1F
cmljc3NvbiBNQ0RFIikKU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gTmV1c2Now6RmZXIgPGoubmV1
c2NoYWVmZXJAZ214Lm5ldD4KLS0tCiBEb2N1bWVudGF0aW9uL2dwdS9tY2RlLnJzdCB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZ3B1L21jZGUucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvbWNkZS5y
c3QKaW5kZXggYzY5ZTk3N2RlZmRhLi5kZDQzZGRlMzc5ZTAgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vZ3B1L21jZGUucnN0CisrKyBiL0RvY3VtZW50YXRpb24vZ3B1L21jZGUucnN0CkBAIC01
LDQgKzUsNCBAQAogPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQoKIC4uIGtlcm5lbC1kb2M6OiBkcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Ry
di5jCi0gICA6ZG9jOiBTVC1Fcmljc3NvbiBNQ0RFIERSTSBEcml2ZXIKKyAgIDpkb2M6IFNULUVy
aWNzc29uIE1DREUgRHJpdmVyCi0tCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
