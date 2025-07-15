Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E217DB05E1E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C42F10E5D8;
	Tue, 15 Jul 2025 13:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6A110E5D8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 13:50:19 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bhLBl3dbyz6M4gG;
 Tue, 15 Jul 2025 21:49:03 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 7F934140446;
 Tue, 15 Jul 2025 21:50:17 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 15 Jul
 2025 15:50:15 +0200
Date: Tue, 15 Jul 2025 14:50:14 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: WangYuli <wangyuli@uniontech.com>
CC: <airlied@gmail.com>, <akpm@linux-foundation.org>,
 <alison.schofield@intel.com>, <andrew+netdev@lunn.ch>,
 <andriy.shevchenko@linux.intel.com>, <arend.vanspriel@broadcom.com>,
 <bp@alien8.de>, <brcm80211-dev-list.pdl@broadcom.com>,
 <brcm80211@lists.linux.dev>, <colin.i.king@gmail.com>, <cvam0000@gmail.com>,
 <dan.j.williams@intel.com>, <dave.hansen@linux.intel.com>,
 <dave.jiang@intel.com>, <dave@stgolabs.net>, <davem@davemloft.net>,
 <dri-devel@lists.freedesktop.org>, <edumazet@google.com>,
 <gregkh@linuxfoundation.org>, <guanwentao@uniontech.com>, <hpa@zytor.com>,
 <ilpo.jarvinen@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <ira.weiny@intel.com>, <j@jannau.net>, <jeff.johnson@oss.qualcomm.com>,
 <jgross@suse.com>, <jirislaby@kernel.org>, <johannes.berg@intel.com>,
 <kuba@kernel.org>, <kvalo@kernel.org>, <kvm@vger.kernel.org>,
 <linux-cxl@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-serial@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <linux@treblig.org>, <lucas.demarchi@intel.com>, <marcin.s.wojtas@gmail.com>, 
 <ming.li@zohomail.com>, <mingo@kernel.org>, <mingo@redhat.com>,
 <netdev@vger.kernel.org>, <niecheng1@uniontech.com>,
 <oleksandr_tyshchenko@epam.com>, <pabeni@redhat.com>, <pbonzini@redhat.com>,
 <quic_ramess@quicinc.com>, <ragazenta@gmail.com>, <rodrigo.vivi@intel.com>,
 <seanjc@google.com>, <shenlichuan@vivo.com>, <simona@ffwll.ch>,
 <sstabellini@kernel.org>, <tglx@linutronix.de>,
 <thomas.hellstrom@linux.intel.com>, <vishal.l.verma@intel.com>,
 <x86@kernel.org>, <xen-devel@lists.xenproject.org>, <yujiaoliang@vivo.com>,
 <zhanjun@uniontech.com>
Subject: Re: [PATCH v2 8/8] scripts/spelling.txt: Add notifer||notifier to
 spelling.txt
Message-ID: <20250715145014.000075ec@huawei.com>
In-Reply-To: <A205796B545C4241+20250715134407.540483-8-wangyuli@uniontech.com>
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
 <A205796B545C4241+20250715134407.540483-8-wangyuli@uniontech.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Jul 2025 21:44:07 +0800
WangYuli <wangyuli@uniontech.com> wrote:

> This typo was not listed in scripts/spelling.txt, thus it was more
> difficult to detect. Add it for convenience.
> 
> Link: https://lore.kernel.org/all/B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com/

Adding a link tag to your own previous patch doesn't seem particularly
useful as something to end up in the git log (which depending on
maintainer preference may gain a link tag to this version).

> Signed-off-by: WangYuli <wangyuli@uniontech.com>
other than that, LGTM

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  scripts/spelling.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/spelling.txt b/scripts/spelling.txt
> index c9a6df5be281..d824c4b17390 100644
> --- a/scripts/spelling.txt
> +++ b/scripts/spelling.txt
> @@ -1099,6 +1099,7 @@ notication||notification
>  notications||notifications
>  notifcations||notifications
>  notifed||notified
> +notifer||notifier
>  notity||notify
>  notfify||notify
>  nubmer||number

