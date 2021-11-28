Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2ED460700
	for <lists+dri-devel@lfdr.de>; Sun, 28 Nov 2021 15:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9023589FF9;
	Sun, 28 Nov 2021 14:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031D089870
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Nov 2021 14:53:01 +0000 (UTC)
X-UUID: 115950d5e86a458383c4f8726f1ca184-20211128
X-UUID: 115950d5e86a458383c4f8726f1ca184-20211128
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 259558279; Sun, 28 Nov 2021 22:52:56 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Nov 2021 22:52:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 28 Nov 2021 22:52:55 +0800
Message-ID: <b6c55b2374e69aa198b2dd934b318767bd6e2b3e.camel@mediatek.com>
Subject: Re: Fix drm suspend and resume issue
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Sun, 28 Nov 2021 22:52:54 +0800
In-Reply-To: <YZXqrxinyBZkBgfq@google.com>
References: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
 <YZXqrxinyBZkBgfq@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, singo.chang@mediatek.com, Jassi
 Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tzung-Bi,

Thanks, I'll fix it.

On Thu, 2021-11-18 at 13:54 +0800, Tzung-Bi Shih wrote:
> On Wed, Nov 17, 2021 at 02:41:55PM +0800, jason-jh.lin wrote:
> > Subject: [PATCH 0/3] Fix drm suspend and resume issue
> 
> You have 2 Subjects.  The first one takes precedence.
-- 
Regards,
Jason-JH Lin <jason-jh.lin@mediatek.com>

