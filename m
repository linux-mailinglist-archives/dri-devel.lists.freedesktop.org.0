Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 644C93B814A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 13:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79A189F55;
	Wed, 30 Jun 2021 11:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0031.hostedemail.com
 [216.40.44.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E058D89FC8;
 Wed, 30 Jun 2021 11:28:43 +0000 (UTC)
Received: from omf01.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 670E2100E7B4F;
 Wed, 30 Jun 2021 11:28:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf01.hostedemail.com (Postfix) with ESMTPA id 6764C1727C; 
 Wed, 30 Jun 2021 11:28:40 +0000 (UTC)
Message-ID: <e3a04d2554bfbe6a7e516c18b5f2848aa040e498.camel@perches.com>
Subject: Re: [PATCH V2] treewide: Add missing semicolons to __assign_str uses
From: Joe Perches <joe@perches.com>
To: Steven Rostedt <rostedt@goodmis.org>
Date: Wed, 30 Jun 2021 04:28:39 -0700
In-Reply-To: <48a056adabd8f70444475352f617914cef504a45.camel@perches.com>
References: <cover.1621024265.git.bristot@redhat.com>
 <2c59beee3b36b15592bfbb9f26dee7f8b55fd814.1621024265.git.bristot@redhat.com>
 <20210603172902.41648183@gandalf.local.home>
 <1e068d21106bb6db05b735b4916bb420e6c9842a.camel@perches.com>
 <20210604122128.0d348960@oasis.local.home>
 <48a056adabd8f70444475352f617914cef504a45.camel@perches.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.52
X-Stat-Signature: whcnsbfbnesep8uuw6hx4999zh9dre4t
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 6764C1727C
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19avg+OhJp2lgEOQwhdkfQyil/n7SIpQsE=
X-HE-Tag: 1625052520-537384
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
Cc: linux-nfs@vger.kernel.org, lima@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2021-06-12 at 08:42 -0700, Joe Perches wrote:
> The __assign_str macro has an unusual ending semicolon but the vast
> majority of uses of the macro already have semicolon termination.

ping?


