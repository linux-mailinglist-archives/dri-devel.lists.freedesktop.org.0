Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7389E33092D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 09:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DD66E820;
	Mon,  8 Mar 2021 08:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7588B6E820
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 08:11:10 +0000 (UTC)
Date: Mon, 08 Mar 2021 08:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1615191068;
 bh=JgpnMwHv+56Z6pM6R18747j5rGXmQCVa51r6ebshfRk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=sfNjOLTVrPdS3IcCfZiOSwBb+EXq+wran9dJbq2YryRlmjvvpb+UCAj28EFCV/cNI
 pt248GoiPdF+tBNLuykiujJySmaldkm6r6v63ajlOtLXurCWvdxlFVmMeja9aLgit4
 rE4vEmw1T1LiEVFjHewVMskmSH+2CJdHNKB5cPU0T4tq2QNEl9K94p9qka5NifYybL
 IErLQfwMwPWMuM5SQnn8XPwN/T4NkSoJZfT/FQa1H1IJhmOQInbnzrXvK56+DgGZvT
 vdPzrwl3+zwQz3aUwrkhK3fGHGzHUDC6bRgB4q8XgaonL5SR1kdtRR7C+EY3SFsB+U
 rHf0fFMiilqRQ==
To: Jianhui Zhao <zhaojh329@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] docs: gpu: fix typo
Message-ID: <hKfmUsjpKZHUiRQ8FD_ZeOFKn1zaa5b5x2rmlF3iWLw4m3aPtg75LyDiFgkeNR5-DlgOzV0Flw6ARPrqJxFGdnHQbVXVyzEV9sHk1J50qAA=@emersion.fr>
In-Reply-To: <20210308064250.3681707-1-zhaojh329@gmail.com>
References: <20210308064250.3681707-1-zhaojh329@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: corbet@lwn.net, airlied@linux.ie, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R-b me. Pushed, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
