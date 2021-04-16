Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A543619AF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 08:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D566E17B;
	Fri, 16 Apr 2021 06:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nl101-3.vfemail.net (nl101-3.vfemail.net [149.210.219.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298EB6E051
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 02:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=vfemail.net; h=date:from
 :to:cc:subject:message-id:in-reply-to:references:mime-version
 :content-type:content-transfer-encoding; s=2018; bh=sPy0NxsKGPgl
 wTY38mvRLqWSwJOlEQ0zIlv+0exAHp4=; b=CXcmsaj5zGUhppNE7lzk/1EWwvNs
 qY/LKkUB0p4s0FvhXuXJd/kkgH8Booo+mjhgblEsmtWTS7pq9WwBSPv12O8XPbuS
 N6VgrZLdYJJQwKzQZ5c3Ccp75/WLv3juXe6iKxNf7TF0o8ug6Yy7UHjNMuTV+KxP
 Kjl5LN1qHDkzaBo=
Received: (qmail 27897 invoked from network); 16 Apr 2021 02:16:30 -0000
Received: by simscan 1.4.0 ppid: 27874, pid: 27884, t: 0.2930s scanners:none
Received: from unknown (HELO bmwxMDEudmZlbWFpbC5uZXQ=)
 (aGdudGt3aXNAdmZlbWFpbC5uZXQ=@MTkyLjE2OC4xLjE5Mg==)
 by nl101.vfemail.net with ESMTPA; 16 Apr 2021 02:16:30 -0000
Date: Thu, 15 Apr 2021 22:16:26 -0400
From: David Niklas <Hgntkwis@vfemail.net>
To: linux-kernel@vger.kernel.org
Subject: Re: [Regression] amdgpu driver broken on AMD HD7770 GHz edition.
Message-ID: <20210415221626.3a33787f@Zen-II-x12.niklas.com>
In-Reply-To: <20210415212508.7ef57d73@Zen-II-x12.niklas.com>
References: <20210415212508.7ef57d73@Zen-II-x12.niklas.com>
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 16 Apr 2021 06:06:46 +0000
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
Cc: alexander.deucher@amd.com, David1.Zhou@amd.com,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

I forgot to give you a bug tracker in case you want one.
Here: https://bugzilla.kernel.org/show_bug.cgi?id=212691

Thanks,
David
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
